/*
 This Processing program converts from the MusicXML file to the Sonic Pi code.
 Programmed by Hiroshi TACHIBANA, 2016.8, CC-BY

 A part one of the top score is converted.
  Please set the MusicXML file name to the line 64.
  data0=loadStrings("???.xml");
 Sonic Pi code is printed out to the standard output.
 Output files "data??.txt" are useless.
 Grace note is 1/16 beat.
 Chords are available.
 Ties are available.
 Chords with ties are unavailable.
*/



// 譏･縺ｮ豬ｷ縺ｮ蝣ｴ蜷医∝ｰｺ蜈ｫ縺ｮxml縲∫清縺ｮ蜿ｳ謇九�xml縲∫清縺ｮ蟾ｦ謇九�xml縺ｮ�薙ヵ繧｡繧､繝ｫ繧呈嶌縺榊�縺怜挨縲�↓螟画鋤縺吶ｋ縲�
//                      蟾ｦ謇句承謇九�縲∫音螳壹�螢ｰ驛ｨ縺�縺代ｒ驕ｸ謚槭＠縺ｦ蜑企勁縺励∵ｮ九ｊ縺九ｉ菴懈�縺吶ｋ縲ゑｼ亥｣ｰ驛ｨ縺ｮ�代→�偵�莠､謠帙ｂ菴ｿ縺�→繧医＞��
// 豕ｨ諢�:   part 2縺ｫ縺ｯ縲�溷ｺｦ謖�ｮ壹�縺輔ｌ縺ｪ縺��
// MuseScore縺ｧ縺ｮ豕ｨ諢擾ｼ壹繝代�繝郁ｭ懊ｒ菴懈�縺励◆蝣ｴ蜷医↓縺ｯ縲∝�鬆ｭ縺ｮ繝代�繝医↓騾溷ｺｦ險伜捷縺後≠縺｣縺ｦ繧ゅ√ヱ繝ｼ繝育ｬｦ蛛ｴ縺ｮ蜷後§菴咲ｽｮ縺ｫ髻ｳ隨ｦ(縺ｾ縺溘�莨醍ｬｦ)縺後↑縺��ｴ謇縺ｫ縺ｯ縲√ヱ繝ｼ繝郁ｭ懷�縺ｫ蠑輔″邯吶′繧後↑縺��縺ｧ縲√ヱ繝ｼ繝育ｬｦ蛛ｴ縺ｫ騾溷ｺｦ險伜捷繧定ｿｽ蜉�縺吶ｋ蠢�ｦ√′縺ゅｋ縲�
// 繧ｳ繝ｼ繝峨↓繧ｿ繧､縺ｯ蟇ｾ蠢懊○縺壹荳榊庄

/* Sinic Pi縺ｫ縺ｦ   use_bpm縺ｨa,b繧剃ｸ玖ｨ倥�繧医≧縺ｫ縺励※縲√ヱ繝ｼ繝域ｯ弱↓繧ｹ繝ｬ繝�ラ縺ｫ縺励※荳ｦ陦悟ｮ溯｡後☆繧�
 in_thread do
 use_bpm 60
 a=[ ]
 b=[ ]
 i=0
 a.length.times do
 play a[i]
 sleep b[i]
 i=i+1
 end
*/



String[] XMLtag1= {
  "part", "divisions"
};//, "score-part","part-list", "part-name"};
String[] XMLtag2= {
  "per-minute", "measure", "<note", "rest", "step", "alter", "octave", "duration", "tie type", "grace", "chord", "arpeggiate", "voice"
};
String[] data0=new String[900000];
String[] data1= {}, data2= {}, data3= {};
String[][] data4=new String[9][9000];
String[][] data5=new String[9][9000];
String[][] data6=new String[9][9000];
String[][] data7=new String[9][9000];
String[][] data7c=new String[9][9000];
int[] partStartLine=new int[9], partEndLine=new int[9], partLength=new int[9]; //繝代�繝域ｯ弱�繝��繧ｿ縺ｮ菴咲ｽｮ
int[] partLength5=new int[9]; 
float[] partDivisions=new float[9]; // 繝代�繝域ｯ弱�騾溷ｺｦ縺ｮ蛻�牡蛟､
int Npart;

void setup() {
  readData();
  //  readData2();
  //  readData3();
}

void readData() {
    data0=loadStrings("harunoumi_v2_2-Koto_Right.xml");  // <<<<<<<<<<<<<< INPUT Music XML file <<<<<<<<<<<

  //  println("蜈ｨ菴薙�讒区�");
  for (int i=0; i<data0.length; i++) {
    for (int j=0; j<XMLtag1.length; j++) {
      if (data0[i].indexOf(XMLtag1[j])>=0) {
        //        println(data0[i]);
        data1=(String[])append(data1, trim(data0[i]));
      }
    }
  }
  saveStrings("data1.txt", data1); //       SAVE1

  //  println("蜈ｨ菴薙�讒区�--縺薙％縺ｾ縺ｧ");
  for (int i=0; i<data0.length; i++) {
    data0[i]=trim(data0[i]);  // 蜈磯�ｭ縺ｮ遨ｺ逋ｽ繧貞叙繧企勁縺�
  }
  for (int i=0; i<data0.length; i++) {
    for (int j=0; j<XMLtag2.length; j++) {
      if (data0[i].indexOf(XMLtag2[j])>=0) {
        // println(data0[i]);
        data2=(String[])append(data2, data0[i]);
      }
    }
  }
  saveStrings("data2.txt", data2);  //          SAVE2
  for (int i=0; i<data0.length; i++) {
    for (int j=0; j<XMLtag1.length; j++) if (data0[i].indexOf(XMLtag1[j])>=0) data3=(String[])append(data3, data0[i]);
    for (int j=0; j<XMLtag2.length; j++) if (data0[i].indexOf(XMLtag2[j])>=0) data3=(String[])append(data3, data0[i]);
  }
  saveStrings("data3.txt", data3); //           SAVE3
  //  println(data0.length); // 蜈ｨ菴�
  //  println(data1.length); // 繝倥ャ繝
  //  println(data2.length); // 讌ｽ隴憺Κ蛻�
  //  println(data3.length); // 繝倥ャ繝�区･ｽ隴憺Κ蛻�
  Npart=0;
  for (int i=0; i<data1.length; i++) {
    if (data1[i].indexOf("<score-part id=")>=0) Npart++;
  }
  //println("繝代�繝域焚: "+Npart);
  int j=0;
  for (int i=0; i<data3.length; i++) {
    if (data3[i].indexOf("<part id=")>=0) {
      partStartLine[j++]=i; // int(data3[i].substring(11, 12));
      //      println(data3[i].substring(11, 12)+" "+i);
    }
  }
  for (int i=0; i<Npart-1; i++) partEndLine[i]=partStartLine[i+1]-1;
  partEndLine[Npart-1]=data3.length;
  //for (int i=0; i<Npart; i++) println("繝代�繝郁｡�"+(i+1)+": "+partStartLine[i]+" "+partEndLine[i]);
  for (j=0; j<Npart; j++) {
    int k=0;
    for (int i=partStartLine[j]; i<partEndLine[j]; i++) {
      if (data3[i].indexOf("<divisions>")>=0) {
        data4[j][k++]="divisions "+data3[i].substring(data3[i].indexOf("<divisions>")+11, data3[i].indexOf("</divisions>"));
        partDivisions[j]=float(data3[i].substring(data3[i].indexOf("<divisions>")+11, data3[i].indexOf("</divisions>")));
      }
      if (data3[i].indexOf("<per-minute>")>=0) data4[j][k++]="per-minute "+data3[i].substring(data3[i].indexOf("<per-minute>")+12, data3[i].indexOf("</per-minute>"));
      if (data3[i].indexOf("<rest/>")>=0) data4[j][k++]="r";
      if (data3[i].indexOf("<grace")>=0) data4[j][k++]="grace";
      if (data3[i].indexOf("<step>")>=0) data4[j][k++]="step "+data3[i].substring(data3[i].indexOf("<step>")+6, data3[i].indexOf("</step>"));
      if (data3[i].indexOf("<alter>")>=0) data4[j][k++]="alter "+data3[i].substring(data3[i].indexOf("<alter>")+7, data3[i].indexOf("</alter>"));
      if (data3[i].indexOf("<octave>")>=0) data4[j][k++]="octave "+data3[i].substring(data3[i].indexOf("<octave>")+8, data3[i].indexOf("</octave>"));
      if (data3[i].indexOf("<duration>")>=0) data4[j][k++]="duration "+data3[i].substring(data3[i].indexOf("<duration>")+10, data3[i].indexOf("</duration>"));
      if (data3[i].indexOf("<tie type=\"start")>=0) data4[j][k++]="tie start";
      if (data3[i].indexOf("<tie type=\"stop")>=0) data4[j][k++]="tie stop";
      if (data3[i].indexOf("<chord/>")>=0) data4[j][k++]="chord"; // step縺ｮ蜑�
      if (data3[i].indexOf("<voice>")>=0) data4[j][k++]="voice "+data3[i].substring(7, 8); // 縲縲縲縲縲縲螢ｰ驛ｨ縺後≠繧句�ｴ蜷�
    }
    partLength[j]=k;
  }
  for (j=0; j<Npart; j++) saveStrings("data4"+j+".txt", data4[j]); //     SAVE4

  for (j=0; j<Npart; j++) {
    //println("########## PART= "+(j+1));
    int k=0;
    for (int i=0; i<partLength[j]; i++) {
      if (data4[j][i].indexOf("chord")>=0) data5[j][k++]="chord"; // chord
      if (data4[j][i].indexOf("per-minute")>=0) data5[j][k++]="use_bpm "+data4[j][i].substring(11, data4[j][i].length()); // bps陦ｨ遉ｺ
      if (data4[j][i].equals("r")) { // 莨醍ｬｦ縺ｨ譎る俣縺ｮ陦ｨ遉ｺ
        data5[j][k++]="play :r "+str(float(data4[j][i+1].substring(9, data4[j][i+1].length()))/partDivisions[j]);
        //        println(data5[j][k-1]);
      }
      if (data4[j][i].equals("grace")) {
        data5[j][k++]="grace";  //  grace縺ｮ蠕後ｍ縺ｮ髻ｳ隨ｦ縺ｫ繧ｪ繧ｯ繧ｿ繝ｼ繝悶′莉倥°縺ｪ縺��
      }
      if (data4[j][i].indexOf("step")>=0) {
        data5[j][k++]="play :"+data4[j][i].substring(5, 6); // step縺後≠縺｣縺溘→縺阪↓縺ｯ髻ｳ隨ｦ陦ｨ遉ｺ

        if (data4[j][i+1].indexOf("alter")>=0) {// step縺ｮ谺｡縺ｮ陦後↓alter縺後≠繧岩勹笙ｭ縺ｮ蝣ｴ蜷�
          if (data4[j][i+1].substring(6, data4[j][i+1].length()).equals("1")) data5[j][k-1]+="s";  // 繧ｷ繝｣繝ｼ繝� 縺ｮ蝣ｴ蜷�
          else if (data4[j][i+1].substring(6, data4[j][i+1].length()).equals("-1")) data5[j][k-1]+="f";  // 繝輔Λ繝�ヨ縺ｮ蝣ｴ蜷�
          data5[j][k-1]+=data4[j][i+2].substring(7, data4[j][i+2].length());     // 繧ｪ繧ｯ繧ｿ繝ｼ繝�
          //            println(i+"��"+j+"�� "+data4[j][i+2]+"�� "+data4[j][i+3]);
          if (data4[j][i+3].indexOf("duration")>=0) data5[j][k-1]+=" "+str(float(data4[j][i+3].substring(9, data4[j][i+3].length()))/partDivisions[j]); // 髟ｷ縺�
        } else if (data4[j][i+1].indexOf("octave")>=0 & data4[j][i+2].indexOf("duration")>=0) {// step縺ｮ谺｡縺ｮ陦後↓octave縺後≠繧岩勹笙ｭ縺ｧ縺ｪ縺��ｴ蜷�
          data5[j][k-1]+=data4[j][i+1].substring(7, data4[j][i+1].length()); // 繧ｪ繧ｯ繧ｿ繝ｼ繝�        grace縺ｮ縺ｨ縺阪↓陦ｨ遉ｺ縺輔ｌ縺ｪ縺�ｼ滂ｼ滂ｼ滂ｼ滂ｼ�
          //            println("$$$$$"+data4[j][i+2]);
          if (data4[j][i+2].indexOf("duration")>=0) data5[j][k-1]+=" "+str(float(data4[j][i+2].substring(9, data4[j][i+2].length()))/partDivisions[j]); // 髟ｷ縺�
        } else  if (data4[j][i+1].indexOf("octave")>=0) {
          data5[j][k-1]+=data4[j][i+1].substring(7, data4[j][i+1].length()); // 繧ｪ繧ｯ繧ｿ繝ｼ繝�        grace縺ｮ縺ｨ縺咲畑
        }
      }
      if (data4[j][i].indexOf("tie")>=0) data5[j][k++]=data4[j][i];
    }
    saveStrings("data5"+j+".txt", data5[j]); //        SAVE5
    //    println("k="+k);
    partLength5[j]=k;
  }

  //  println(data5[0][100]);
  int[][] tieS=new int[9][99], tieE=new int[9][99];
  String tmp;
  //  for (j=0; j<Npart; j++) {
  j=0;
  int k1=0, k2=0; // 繧ｿ繧､start,end縺ｮ蛟区焚.縲k1縺ｨk2縺ｯ遲峨＠縺�ｿ�ｦ√≠繧�
  for (int i=0; i<partLength5[j]; i++) {
    //      tmp=data5[j][i];
    if (data5[j][i].indexOf("tie start")>=0) {
      tieS[j][k1]=i;                           // 繧ｿ繧､縺ｮ髢句ｧ九�陦後ｒ險倬鹸縺吶ｋ
      //println(k1+" tie start="+i);
      k1++;
    }
    if (data5[j][i].indexOf("tie stop")>=0) { 
      tieE[j][k2]=i;                           // 繧ｿ繧､縺ｮ邨ゆｺ��陦後ｒ險倬鹸縺吶ｋ
      //println(k2+" tie stop="+i);
      k2++;
      if (tieS[j][k1-1] != tieE[j][k2-1]-2) println("#### 隴ｦ蜻� 蜊倬浹縺ｧ縺ｪ縺�ち繧､縺後≠繧� ###");
      if (k1 != k2) println("#### 隴ｦ蜻� 繧ｿ繧､縺ｮ髢句ｧ九→邨ゆｺ��謨ｰ縺悟粋繧上↑縺� ###");
    }
  }
  //println("繧ｿ繧､縺ｮ蛟区焚="+k1);

  // tie start縺ｮ蜑阪�陦鯉ｼ医ち繧､縺ｮ繧ｹ繧ｿ繝ｼ繝磯浹隨ｦ�峨�髟ｷ縺輔ｒ繧ｿ繧､蜈ｨ菴薙�髟ｷ縺輔↓縺吶ｋ縲�
  // tie stop縺ｾ縺ｧ縺ｮ繧ｿ繧､縺ｮ荳ｭ縺ｮ髻ｳ隨ｦ縺ｯ縺昴�縺ｾ縺ｾ谿九☆縲�
  float sum=0;
  j=0; // 繝代�繝� (蟇ｾ蠢懊ヱ繝ｼ繝医�0縺ｮ縺ｿ縺ｧ菴ｿ逕ｨ縺帙★)
  for (int i=0; i<k1; i++) { // 繧ｿ繧､縺ｮ蛟区焚蛻��繝ｫ繝ｼ繝�
    //println("tie= "+(tieS[j][i]+1)+" 縲� "+tieE[j][i]);
    int nseq=0; // 騾｣邯壹＠縺溘ち繧､縺ｮ謨ｰ
    for (int iseq=i; iseq<k1-1; iseq++) {
      if ( tieE[j][iseq] != tieS[j][iseq+1]-1) break;
      else nseq++;
    }
    //println("繧ｿ繧､縺ｮ騾｣邨先焚nseq=" +nseq);
    if (nseq==0) { // 繧ｿ繧､縺御ｸ縺､縺ｮ蝣ｴ蜷�
      String[] t1=splitTokens(data5[j][tieS[j][i]-1 ], " "); // 繧ｿ繧､縺ｮ蜑榊��弱ち繧､縺檎ｶ壹＞縺溷�ｴ蜷医�縲》ie stop縺ｨ縺ｪ縺｣縺ｦ縺励∪縺�お繝ｩ繝ｼ縺吶ｋ
      String[] t2=splitTokens(data5[j][tieS[j][i]+1], " ");  //縲繧ｿ繧､縺ｮ蠕後ｍ蛛ｴ
      //println(i+" "+j+" "+tieS[j][i]+" "+data5[j][tieS[j][i]-1]);
      data5[j][tieS[j][i]-1]=t1[0]+" "+t1[1]+" "+str(float(t1[2])+float(t2[2])); // �薙▽莉･荳翫�髻ｳ隨ｦ縺碁｣邨舌＆繧後◆繧ｿ繧､縺ｫ蟇ｾ蠢懊＠縺ｦ縺�↑縺�
      //println("New data5:"+data5[j][tieS[j][i]-1]);
    } else { //繧ｿ繧､縺碁｣邨舌＠縺ｦ縺�ｋ蝣ｴ蜷�
      //println("繧ｿ繧､縺碁｣邨� i="+i);
      String[] t1=splitTokens(data5[j][tieS[j][i]-1 ], " "); // 繧ｿ繧､縺ｮ蜑榊�
      String[] t2=splitTokens(data5[j][tieE[j][i]-1 ], " "); //縲譛蛻昴�繧ｿ繧､縺ｮ蠕後ｍ蛛ｴ
      //println("t1="+t1[0]+" "+t1[1]+" "+t1[2]);
      //println("t2="+t2[0]+" "+t2[1]+" "+t2[2]);
      sum=float(t1[2])+float(t2[2]); // 荳縺､逶ｮ縺ｮ繧ｿ繧､縺ｾ縺ｧ縺ｧ縺ｮ髻ｳ隨ｦ縺ｮ髟ｷ縺輔�蜥�
      // println("sum="+sum);
      for (int iseq=0; iseq<nseq; iseq++) {
        String[] t3=splitTokens(data5[j][ tieE[j][i]+(iseq+1)*3-1 ], " ");  //縲繧ｿ繧､縺ｮ蠕後ｍ蛛ｴ
        sum+=float(t3[2]);
      }
      data5[j][tieS[j][i]-1]=t1[0]+" "+t1[1]+" "+str(sum); // �薙▽莉･荳翫�髻ｳ隨ｦ縺碁｣邨舌＆繧後◆繧ｿ繧､縺ｫ蟇ｾ蠢懊＠縺ｦ縺�↑縺�
      i+=nseq;
    }
  }

  //  grace縺ｮ蠕後ｍ縺ｮ陦後�髻ｳ隨ｦ縺ｫ譎る俣 0.0625繧貞刈縺医ｋ
  //  grace縺檎ｶ壹￥蝣ｴ蜷医↓縺ｯ縲∝酔讒倥↓    蠕後ｍ縺ｮ陦後�髻ｳ隨ｦ縺ｫ譎る俣 0.0625繧貞刈縺医ｋ
  //  譛蠕後�grace縺ｮ�偵▽蠕後ｍ縺ｮ髻ｳ隨ｦ縺九ｉgrace蛻��髟ｷ縺輔ｒ蠑輔￥縲�
  j=0;
  for (int i=0; i<partLength5[j]; i++) {
    //    println("i="+i+" "+partLength5[j]);
    int NNgrace=0;
    //    println("data5[j][i]="+data5[j][i]);
    if (data5[j][i].indexOf("grace")>=0) { // 迴ｾ蝨ｨ菴咲ｽｮ縺携race縺九←縺�°隱ｿ縺ｹ繧�
      data5[j][i+1]+=" 0.0625";//125"; // grace note縺ｮ髟ｷ縺輔ｒ荳弱∴繧九0.125 = 32蛻�浹隨ｦ
      NNgrace=1;
      while (data5[j][i+NNgrace*2].indexOf("grace")>=0) {//grace縺檎ｶ壹＞縺ｦ縺�ｋ縺九←縺�°隱ｿ縺ｹ繧�
        data5[j][i+NNgrace*2+1]+=" 0.0625";//125"; // grace note縺ｮ髟ｷ縺輔ｒ荳弱∴繧九0.125 = 32蛻�浹隨ｦ
        NNgrace++;
      }
      //      println("NNgrace="+NNgrace);
      //      println(data5[j][i+NNgrace*2]);
      String[] t1=splitTokens(data5[j][i+NNgrace*2], " ");
      data5[j][i+NNgrace*2]=t1[0]+" "+t1[1]+" "+str(float(t1[2])-NNgrace*0.0625);//0.125);// 蠕後ｍ縺ｮ髻ｳ隨ｦ縺九ｉgrace蛻��髟ｷ縺輔ｒ蠑輔￥
      i+=NNgrace*2+2;
    }
  }
  saveStrings("data6"+j+".txt", data5[j]);

  // tie start縺九ｉtie stop縺ｾ縺ｧ繧貞炎髯､縺吶ｋ
  // grace 縺ｮ陦後�縺ｿ繧貞炎髯､縺吶ｋ
  j=0;
  int k=0;
  for (int i=0; i<partLength5[j]; i++) {
    data6[j][k]=data5[j][i];
    //    int tie_s;
    int tieLines=0;
    if (data5[j][i].indexOf("tie start")>=0) {
      //      println("tie start "+i+" "+data5[j][i]);
      //      tie_s=i;
      while (data5[j][i+tieLines].indexOf("tie stop")<0) {
        tieLines++;
      }
      //      println("tieLines="+tieLines);
      //      println("tie stop "+(i+tieLines)+" "+data5[j][i+tieLines]);
      k--;
    }
    i+=tieLines;
    k++;
  }

  int k3=0;
  for (int i=0; i<k; i++) {
    if (data6[j][i].indexOf("grace")<0) {  // grace縺ｮ陦後ｒ蜑企勁縺吶ｋ
      data7[j][k3]=data6[j][i];
      k3++;
    }
  }

  int kc=0;// 譁ｰ縺励＞髻ｳ隴憺�蛻励�隕∫ｴ�
  String tmpTime="";
  for (int i=0; i<k3; i++) {
    String tmpC=data7[j][i];
    if (data7[j][i].indexOf("chord")>=0) { // 蜥碁浹縺ｮ縺ｨ縺�(�帝浹逶ｮ)
      int ic=1; // �帝浹縺ｮ繧ｳ繝ｼ繝峨�縺ｨ縺�=��
      while ((i+ic*2)<k3 &&  data7[j][i+ic*2].indexOf("chord")>=0) { // 蜥碁浹縺ｮ髻ｳ謨ｰ繧呈焚縺医ｋ縲ゑｼ茨ｼ馴浹莉･荳奇ｼ�
        //        println(i+" "+ic+" "+data7[j][i+ic*2]);  //    譛蠕後′蜥碁浹縺ｮ蝣ｴ蜷医↓繧ｨ繝ｩ繝ｼ縺吶ｋ
        ic++;
      }
      tmpC="play ["; // 繧ｳ繝ｼ繝峨�蝣ｴ蜷医�浹隴懊�蜈磯�ｭ縺ｯ縲�"["
      for (int ic2=0; ic2<ic+1; ic2++) {
        String[] t1=splitTokens(data7[j][i-1+ic2*2], " ");
        tmpC+=t1[1]+","; // 蜥碁浹縺ｮ髻ｳ隴懊ｒ謚ｽ蜃ｺ
        tmpTime=t1[2]; // 蜥碁浹縺ｮ髟ｷ縺�
      }
      tmpC=tmpC.substring(0, tmpC.length()-1)+"]"+" "+tmpTime; // 譛ｫ蟆ｾ縺ｮ","繧貞炎髯､縺冷拆"繧貞刈縺医ｋ
      //      println("tmpC="+tmpC);
      i+=ic*2; // 蜈��驟榊�繧貞柱髻ｳ蛻�□縺鷹ｲ繧√ｋ
      data7c[j][kc-1]=tmpC; // 譁ｰ縺励＞髻ｳ隴懊�驟榊�縺ｫ蜥碁浹繧貞�繧後ｋ
      data7c[j][kc]=data7[j][i];
    } else data7c[j][kc]=tmpC; // 蜥碁浹縺ｧ縺ｪ縺��ｴ蜷医↓縲∝�縺ｮ髻ｳ隴懊ｒ譁ｰ縺励＞驟榊�縺ｫ蜈･繧後ｋ縲�
    kc++;
  }
  //  for (int i=0; i<kc; i++) println("data7c= "+data7c[j][i]);

  //  println("============data7=======");
  //  for (int i=0; i<partLength5[j]; i++) println(data7c[j][i]);
  int len7=0;
  for (int i=0; i<partLength5[j]; i++) if (data7c[j][i] != null) len7++;
  //  println("data7_len="+len7);
  String[] data8;
  data8=new String[len7]; // 縲縲縲縲縲縲縲縲data7縺九ｉ繝��繧ｿ髟ｷ縺ｮ驟榊�縺ｮdata8繧剃ｽ懊ｋ縲�
  for (int i=0; i<len7; i++) data8[i]=data7c[j][i];  // data�倥°繧峨�縲√ヱ繝ｼ繝茨ｼ代�縺ｿ繧呈桶縺�
  saveStrings("data8"+j+".txt", data8); //                      SAVE8
  //  println("============data8=======");
  //  for (int i=0; i<data8.length; i++) println(data8[i]);

  println("=========== Sonic Pi program ================================");
  //  String data9[] =new String[len7];
  String tmpS1;
  String tmpS2;
  String tmpS3="c=[";
  int ibpm=0;
  println("a=[]");
  println("b=[]");
  for (int i=0; i<data8.length; i++) {
    //  use_bpm豈弱↓驟榊�縺ｫ髻ｳ隨ｦ繧貞�繧後ｋ
    int playLines=0;
    tmpS1="a["+ibpm+"]=[";
    tmpS2="b["+ibpm+"]=[";
    if (data8[i].indexOf("use_bpm")>=0) {
      //      println(data8[i]);
      tmpS3+=data8[i].substring(8, data8[i].length())+",";
      if (i==0)i++;
    }
    while (i<data8.length && data8[i].indexOf("use_bpm")<0 ) {
      //      playLines++;
      String[] t1=splitTokens(data8[i], " ");
      tmpS1+=t1[1]+",";
      tmpS2+=t1[2]+",";
      i=i+1;
    }
    tmpS1=tmpS1.substring(0, tmpS1.length()-1)+"]";
    tmpS2=tmpS2.substring(0, tmpS2.length()-1)+"]";
    println(tmpS1);
    println(tmpS2);
    if (i<data8.length && data8[i].indexOf("use_bpm")>=0) {
      tmpS3+=data8[i].substring(8, data8[i].length())+",";
      ibpm++;
    }
  }
  tmpS3=tmpS3.substring(0, tmpS3.length()-1)+"]";
  if(!tmpS3.equals("c=]")) println(tmpS3);
  println("in_thread do");
  //  println("i=0");
  println("for i in 0..a.length-1");
  if(!tmpS3.equals("c=]")) println("use_bpm c[i]");
  //  println("j=0");
  println("for j in 0..a[i].length-1");
  println("play a[i][j]");
  println("sleep b[i][j]");
  //  println("j+=1");
  println("end");
  //  println("i+=1");
  println("end");
  println("end");
}