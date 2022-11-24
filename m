Return-Path: <SRS0=sezm=3Y=quicinc.com=quic_rjliao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAC8C43219
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Nov 2022 06:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6FCBC433C1; Thu, 24 Nov 2022 06:55:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C621C433D6
	for <linux-firmware@kernel.org>; Thu, 24 Nov 2022 06:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C621C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO5w0n6024514
	for <linux-firmware@kernel.org>; Thu, 24 Nov 2022 06:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=VXXnOcp7LywLk9TR+W3LsKeNc6wR+aOZeB2FWPwnFkA=;
 b=FYwtyBVsYA31n40hwyM37+0shktjc57WdThfhN8SnmcMSGLPjCM2vsYwEMPz3uQih3Nx
 GSOBGG0KUKYqYuGe7m6FbuU7CmBnunJ2JM76DrK8PQCfYltmZ6OnvzXMkUJNkttDO6oG
 23BhRDriT7VzjUasPkTtfJKNLFZgiDVa0JB4tRRwHtQR9eEpKFM+EO2HB1F0FNOkG1mW
 J+/NgXcbJfvUdFsL4FUAhRorC55zYy+N624USbxu+cxkLZ/FGzpTmADZxnfVrkwXPkWz
 By/qA87k+H32UQ3JnP2VA6Mkx0Ba2bmiXOdf53cK6HG4PPBa3W8iRPfsYhBJlr5Ze1xX sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m15secg61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Nov 2022 06:55:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AO6tABZ006214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Nov 2022 06:55:10 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 23 Nov 2022 22:55:10 -0800
Received: from nalasex01b.na.qualcomm.com ([fe80::1348:ecca:19c2:8e2e]) by
 nalasex01b.na.qualcomm.com ([fe80::1348:ecca:19c2:8e2e%12]) with mapi id
 15.02.0986.036; Wed, 23 Nov 2022 22:55:10 -0800
From: "Rocky Liao (QUIC)" <quic_rjliao@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: btqca firmware 20221124
Thread-Topic: btqca firmware 20221124
Thread-Index: Adj/0R3h+yc75yIGSL6/1kT8hfVWFA==
Date: Thu, 24 Nov 2022 06:55:10 +0000
Message-ID: <90a2aec23a5744a696b0f29942ae2838@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.253.78.0]
Content-Type: multipart/alternative;
	boundary="_000_90a2aec23a5744a696b0f29942ae2838quicinccom_"
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IZRj_WeowpAk35Yb8J8SDVd4KVJR0jRq
X-Proofpoint-GUID: IZRj_WeowpAk35Yb8J8SDVd4KVJR0jRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_04,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1011 mlxlogscore=680 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240052

--_000_90a2aec23a5744a696b0f29942ae2838quicinccom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you=
 have any problems.

The following changes since commit
cdf9499cf6706b73935a139bb5e76777a87674fe:

   linux-firmware: update firmware for MT7916 (Wed Nov 23 19:07:43 2022 +08=
00)

are available in the Git repository at:

   https://github.com/quicrjliao/qcabtfw.git

for you to fetch changes up to 32d8681d21f2eef052cadfdfafc47e02eed6c2b2:
----------------------------------------------------------------
Rocky Liao (1):
        QCA: Add Bluetooth firmware for WCN785x (Thu Nov 24 14:44:27 2022 +=
0800)


--_000_90a2aec23a5744a696b0f29942ae2838quicinccom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#333333;background:white">Hi&nbsp;linux-firmware&nbsp;=
maintainers,</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier=
 New&quot;;color:#333333"><br>
<br>
<span style=3D"background:white">Here's a pull request for btqca bluetooth =
driver. Please let me know if you have any problems.</span><br>
<span style=3D"background:white"><br>
The&nbsp;following&nbsp;changes&nbsp;since&nbsp;commit<br>
cdf9499cf6706b73935a139bb5e76777a87674fe:<br>
<br>
&nbsp;&nbsp;&nbsp;linux-firmware: update firmware for MT7916 (Wed Nov 23 19=
:07:43 2022 &#43;0800)<br>
<br>
are&nbsp;available&nbsp;in&nbsp;the&nbsp;Git&nbsp;repository&nbsp;at:<br>
<br>
&nbsp;&nbsp;&nbsp;<a href=3D"https://github.com/quicrjliao/qcabtfw.git"><sp=
an style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;col=
or:#333333;text-decoration:none">https://github.com/quicrjliao/qcabtfw.git<=
/span></a><br>
<br>
for&nbsp;you&nbsp;to&nbsp;fetch&nbsp;changes&nbsp;up&nbsp;to&nbsp;32d8681d2=
1f2eef052cadfdfafc47e02eed6c2b2:<br>
----------------------------------------------------------------<br>
Rocky&nbsp;Liao&nbsp;(1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QCA: Add Bluetooth firmware=
 for WCN785x (Thu Nov 24 14:44:27 2022 &#43;0800)</span></span><o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_90a2aec23a5744a696b0f29942ae2838quicinccom_--
