Return-Path: <SRS0=NOLB=SI=quicinc.com=quic_renjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB565D41C35
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 10:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 972DCC4CED2; Wed, 13 Nov 2024 10:50:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A34C1C4CED0
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A34C1C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9sgaB018297;
	Wed, 13 Nov 2024 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=EKKDI+2rSC8HVmzRyHXSPd9HNFJKcWW+Xm1y9+PTrNo=; b=gW
	hmhlE0qTz7HDU2OKMX8RvoOPdHswHtcnMCjM2GxCoRexRf8u5qHLNIR2u8aMN2M5
	jainvKEu4nSj6z1+M5h4Y2sfaFtzEWTKLkfqTNS6wGPAH0nHuAxJ2ZNegc8fZ8qL
	L8GtOEIx+P3zT9PiqYOcbEoh2vbBCngSFzKXypm5qtiDCix0irFS/cqDL+7QK2aW
	ecBPzjPoJ9R98kyneielAI48h8kRGCGqY9Hg6jhhdiCK2/9/0/i1fD1z8x8xsEVH
	CfN6ws3AU2ut341ELfNcrXmZxCTix3EE9kShRNohP2Y5notXOnG+ablzpucHW185
	kxBo+4c4oBqPy0cKFNQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kquprt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 10:50:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADAoifP029325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 10:50:44 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 02:50:44 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85]) by
 nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85%11]) with mapi id
 15.02.1544.009; Wed, 13 Nov 2024 02:50:44 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
Subject: add venus firmware file for qcs615
Thread-Topic: add venus firmware file for qcs615
Thread-Index: Ads1ucHM/fgUZgFsS8mAyG/ak9ewxA==
Date: Wed, 13 Nov 2024 10:50:44 +0000
Message-ID: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.231.216.103]
Content-Type: multipart/alternative;
	boundary="_000_83153c5ab8374e008d62646f200f9a04quicinccom_"
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k0ALIvJdu9hztwkvzpOVOOM_FqVfDN52
X-Proofpoint-GUID: k0ALIvJdu9hztwkvzpOVOOM_FqVfDN52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=648
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130094

--_000_83153c5ab8374e008d62646f200f9a04quicinccom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe=
:

  Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the Git repository at:

  git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git=
.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615

for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:

  qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 =
+0530)

----------------------------------------------------------------
Renjiang Han (1):
      qcom: venus-5.4: add venus firmware file for qcs615

WHENCE                      |   1 +
qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
2 files changed, 1 insertion(+)
create mode 100644 qcom/venus-5.4/venus_s6.mbn

Best Regards,
Renjiang

--_000_83153c5ab8374e008d62646f200f9a04quicinccom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The following chang=
es since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; Merge branch=
 'verb' into 'main' (2024-11-11 20:01:00 &#43;0000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">are available in th=
e Git repository at:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; <a href=3D"m=
ailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git">
git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git</a> video-firmwa=
re-qcs615<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">for you to fetch ch=
anges up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; qcom: venus-=
5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 &#43;0530)<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-------------------=
---------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Renjiang Han (1):<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; qcom: venus-5.4: add venus firmware file for qcs615<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">WHENCE&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 &#43;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">qcom/venus-5.4/venu=
s_s6.mbn | Bin 0 -&gt; 922240 bytes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2 files changed, 1 =
insertion(&#43;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">create mode 100644 =
qcom/venus-5.4/venus_s6.mbn<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal">Best Regards,<span style=3D"font-size:11.0pt"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal">Renjiang<o:p></o:p></p>
</div>
</body>
</html>

--_000_83153c5ab8374e008d62646f200f9a04quicinccom_--
