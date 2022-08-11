Return-Path: <SRS0=Lw6X=YP=qti.qualcomm.com=tjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7E3C19F2A
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Aug 2022 13:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F219C433D6; Thu, 11 Aug 2022 13:26:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36F91C433C1
	for <linux-firmware@kernel.org>; Thu, 11 Aug 2022 13:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36F91C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B92SJ9023753
	for <linux-firmware@kernel.org>; Thu, 11 Aug 2022 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : subject
 : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=cJBr+E65JGZvKtSaWTjMAUMk4Q3s/36MLf3+wveUk0o=;
 b=GCMpKDfxqVQOfVI/GrXPQWol2CoYBbA3/91OUQt6bKcOY1IARuMrVR6LqO2Nc+Z6FNO5
 o7o3pAedg9erdIZj60ZTBYM842DcAcjYMZ3hr/CRoTRdrRi1FstJf0PZdkbIxuzMY51x
 CynyahKXhj+bxtcKAb2OgMzUoTCQhPLFdYYHCCbHoitOLkmEQi6BtYwiNzYo2Mm7TT6D
 FVSjGJKC/zrTtoBAUw25hWLjIJkJNfBkQhZjuC7PjmAxa8azkQfzH0RsBmfHzXaPOGhI
 mZnJxskRgcR1bHXJ8dgua8Cw07wQDUpKLTPdHBca6N/fE1gL4SaYJWzy6/F5re+1VGGh Rg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hvtrnsc42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Aug 2022 13:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdXkgJYjdeBB0N9zx2oph0Om5InnUifLg2K4kVFW7L10zcQSyMLV+l2/9Vjl99/N2gjhCJKAL05TmWsPJBKLFCXRF1T55uC90fi98wlRsayb4PPQebTkRNGRZJThA2cGIfTHjoRD2nusL8xMt84B8Y3P7wkHTN/1rgQ3RAPGApuTy9MZuxBKBP/Sv9d8bArvaPQCi2bwBWm7CuYyZ5O2N3tMZzYXlvUTkJvax7xeHaEbjHY3Xf0X07IKTu18e1rCOLIPxSuM1r8o2uC5VfLFncuRUdam6ySlmHQTHWC7rAjO/BjIj7uF38wQX6PWkmwPbqeZqAA4Zein0C1ap6EdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJBr+E65JGZvKtSaWTjMAUMk4Q3s/36MLf3+wveUk0o=;
 b=bRE/SiBw2gJg1dg0r4rwnVCAuPDbh+MTQR/d99leWSJht+AIiq067fEeJJRiQ6VZfP0X1mTecJg80A1XPWY+X9eNNxOU/PykjXJMOaRkBw0+ZFjlZfbAVCBr7OxrDHPI1yZWsk4G8WUm8uVGilEySju6toQf82mqW7tS0s3o2qTZEL3EI3FNS717OdrQVvVfLwjkWPaGs7qjQsP23B3eotN85j6T9rrZyF+66zG7d4noIsHVtz0uyFJizsqAw/rVX55JN1E/4TaD0XJFw4ZJ+PcVuFwI8Iy9aJN/GjNMdcIBFX1jTUhE29dGWpq9eTQ3+fnGVkDJq3sF4JYJDVJwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM5PR02MB3686.namprd02.prod.outlook.com (2603:10b6:4:b2::39) by
 CO6PR02MB7521.namprd02.prod.outlook.com (2603:10b6:303:ad::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Thu, 11 Aug 2022 13:26:16 +0000
Received: from DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::8c1a:a99f:8e7f:e3e0]) by DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::8c1a:a99f:8e7f:e3e0%4]) with mapi id 15.20.5504.016; Thu, 11 Aug 2022
 13:26:16 +0000
From: Tim Jiang <tjiang@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: btqca firmware 20220811
Thread-Topic: btqca firmware 20220811
Thread-Index: Adithe28qEWH1Ar8QkifurHsG8DY8w==
Date: Thu, 11 Aug 2022 13:26:15 +0000
Message-ID: 
 <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 075f1918-0941-4451-78b4-08da7b9d118a
x-ms-traffictypediagnostic: CO6PR02MB7521:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jOFHvbC0B95jnvGBPs26Bi7bvXl/t1kIeQBuMoAgfwmLBnrnSFN+pzapi8Jf5w5rBUQ45RX6LusBUC5TWndw+AxDfXRXMdhceyptc26rflN1wjYJF+7c7ul2DgXidWWxMYxfwrGaIAN+Ms81nebHB05sLAq8IULfuyHkftnxhEBecSj0ouKyjsbmvwQNLQBUbKPXFewF+YY7K/Gb4d6q4lQB2m0jaRZ3pkp0KKjDCZ/8saWKEp4WJ3VHTUC2JV7SHsPj0T4vI28yGwofsNSl5BY4eWsIYj5gDZMQgp6uuNzsxD4BWakMue4scE+XzauBeLudna8Pv4gmB4dvaCMGNipFxHTaj5d12Y5xVXqG99rgds0trly9qeeKCpGuUArb7TSy4aqnuYIRAXqItFFk9iylpoRieH8fpni0vM37N2ywylZfJNkAj9PtjHwYKbWY+lo0tCnV98gIohwPQificNTLSNf7RptNSS5cmTxTchCvbO5ZZF63XPw2kOiRfruWl1rD18CLpDa/OjTfjxLhjko/y+Qc/48ZDbNuz73aF28Yp8pZpZDQckYOHllJHxisKWug1t0s2iU9h96N1G0ejtpXsxHjdd73GL+BR8CmJG0O6R1TNb9cOEI/dgr5Kery00ZJoV7GSE53laR9H/gBqc4wK1OAAlGtWyyOJLJxZqX0vsgwzD0IZvT5+Heebq+CTI3zmwxtPpDPDxrWxoSiAEV/L0CIad1mFE7ywbYzNkCuGxUQ2P6sWNO4tl0zpgCKOXZ6Kb/Sna3V0rOEZe+rEep4dM4LyY08n59Va0X8+H3CujVRr4sWxAeypBb14/wv2d2NOMAszgaXJGl3NsXxy9V2QymerO6tFHWNDgFMzuLU7EFayN0iK5o2USctmp4O
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3686.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(2906002)(186003)(9686003)(6916009)(33656002)(8936002)(86362001)(83380400001)(55016003)(5660300002)(4744005)(52536014)(7696005)(66476007)(66446008)(66946007)(8676002)(64756008)(66556008)(38070700005)(122000001)(76116006)(38100700002)(26005)(7116003)(316002)(6506007)(41300700001)(478600001)(966005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1gB26/ubbKh8X/T9DudjaKEW4q7GKBu1kH8svEdzroRu3CpsQ657iSaembHD?=
 =?us-ascii?Q?AtnCbuOwa3rF1kycDfwXOJ5qyedUT96MggnXmkjkykTzFE9/979s3dh+i9BA?=
 =?us-ascii?Q?pwAme+HOmWA2trEV+c0XH6LFWGkDQZ+eiK2fOeiXL7HZpfI9SxkT21OV0BI7?=
 =?us-ascii?Q?jtpb0E95hakRgLzdmeGwjuTtM6KMOULAgH6/q6nuJ8TFMqm+CEBs5Q1p28X2?=
 =?us-ascii?Q?u9SQs34DOv7nwG1uKXKoKtt6Vu19IAtmW0fYXqjZ4QIuSQoovwYm1hMgORau?=
 =?us-ascii?Q?d03aYF12jg+dZ2QN6cHgfvHal4sACoKaTpDz5rNRGb64xJgeSP7BBxPy2Lyv?=
 =?us-ascii?Q?7OKKGq+vw68kaODNL3vdw48iBcLH6pppCDRMcwJfCrhuXFX+bfLDAnhqg5kv?=
 =?us-ascii?Q?qJfUWkeDHqhL0/RkLWWu0FTyUVszamPnchLyofI2xZaur/rUSN0KTPzxJdfS?=
 =?us-ascii?Q?dPb83n9b9McOQHQAaWb6j8nRwThEWWN8k0LOARiO0WkEXhZ8OE6JxF6S6NAM?=
 =?us-ascii?Q?wSlB5FLhKlroqaOTfxhIlz1eguOHBVLAdxU3HCyj3mbmygcwCLmC0ZL4uoXH?=
 =?us-ascii?Q?E8coifFedpRlQ7bk6IgONaHssyZqj3cvU6oxSr+1LaKKwB/ksS6JmhkOsS1J?=
 =?us-ascii?Q?zuT5irKrOrdK4M8GLMiBCJtd9uI2Eg5OD3SPoRwz0ZpQu3o+gipayV0om5eS?=
 =?us-ascii?Q?EI+O0r9o+iNnkmqF3uB5ZXFlLVU7/90mEjsNbmAGPsnUNyZul5sX/dXdgKmv?=
 =?us-ascii?Q?KoPRx/Kn0/Fm9o7SFA0tfs2j+DoFZh63EERpBJio1PEcTv8geCTNLp9XLngW?=
 =?us-ascii?Q?G1Ybl85a+nvP8TWV668wmZVUsIsQZ2NswqXmlsm9OpPtdSC4jTyOWeEhP2cJ?=
 =?us-ascii?Q?6dBvzdO9wToujmXFAeE7Jt7EqSQeyNPC5RIe1t+wEu0fyAf2citc5sJebMK1?=
 =?us-ascii?Q?c/yVGA+iCUhyTUIcrXbHny6NFaRflkuzaB72vJmFTe5lCOEiZcbNQIn0VFt/?=
 =?us-ascii?Q?de4W0rpvD+SNi5ronjCEHKAqbmWVW7RkS/M0boyQ3XfiiM2BPQwct6gjv6ab?=
 =?us-ascii?Q?cw6yQs/N/9f7jjfd3X3LZ4+QFlFU6fLn3LGDQ0Ag4asdfQ6gsZWwt4QXuNSV?=
 =?us-ascii?Q?Z24nHmRSLM+TzEvb5I4o+kJTZ8QOgH4jiyWgPCoawZ2q51VSR5mJ21w4mBCr?=
 =?us-ascii?Q?UmV1LeuzkNV20nXErizwpl6QoTG2LH5PQucs31NJwFKN9QPTHto5pYKAOL6Z?=
 =?us-ascii?Q?goTZ2mEk8gVV76YKxyCAqytiNr289mhbpM8DgVN0U7UBvgDS2xqFM4CXihll?=
 =?us-ascii?Q?AQvsld8zTeCCnRSkNBfbNa8OoFrLvQInZDaz6FqfethCG3G185Qthz00mXzJ?=
 =?us-ascii?Q?UTTaJLR8Kn5Aoy0ne/InjQwDkNHLmPMYsruOS56AN2bcaUqzyCYhbsfJeg3I?=
 =?us-ascii?Q?1H67AExTrkQ04qyD3M8IBEgY3o0pI+p180/3XaTNKu0w4b+7WS5cE736ATTv?=
 =?us-ascii?Q?lDTXKG/ScsSQ4e7hhbpGUEXJJ4EOHTsAj2mauPkloFx+/eLLNcnx4cGwTGit?=
 =?us-ascii?Q?//EsGkUmAvyVaPo3q7Ko1XvNTYYLVISuluqMSXRS?=
Content-Type: multipart/alternative;
	boundary="_000_DM5PR02MB3686017F1E5D47CDE88F9BE2ED649DM5PR02MB3686namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XvpuX26bDr37Z3zrDDSDpzoc5Xk7IJAF5WBPil3cMsd0pCKZzaZOb6eMRJlaQ97bsiNEUedaxNcy0eTZZvLu7h07uzslsiPEVh7oVEMP0CsXGymrGbO8BGtUMerraRbSKVrwqmwlARdS9iSfeKhbB2Uqhe87rvNwlfGi+Mg7/8gemyj4wHvx8Ft2tevjPjteiv/yQXG8/X2ud1xH7+7VTkdRgorY8plc0gl8++KxMW0PkDkQoEq6G0hX14p2fkuT/att6WRZhkCIgy7/KU+Vuxha3qN27CkPXBZ3Vcin7G6fx40AD2PbEa7EEvNRu8pBtKBoxGT1B8f9GN3eiTjWYCQEzC8OYyM57dX8EV005I+w0x99bDcecsaQMl0cxAdOKsSiCqsdD0vqJ09XVvd5bhCrCE7T4DzQ0qGAnSLbDUIjgbF5diN5ofn+Z9ghgzCLioOphUTWwsqbOIiK8pu8doHDpg2BJN/4B4sY0hWvLj3J/lhwD1M2FvlWfmRjbP/yeqDtctHcWkc26yqFmNm27KapwcrOdJC16IIjhf4ZWV03cFhZN0o5wmnNoZXt3Rml7fVg0E1+f39jgh1zyerHhbdnr9CKuVBlL0OIBuW8xIYv9G8TZvooB9j4r0L/FmLyD1xjNk1WoTzZK9Aq0pTR2VEc1s3nkQCFh5sTPgdG4ZlgApPGEsA+Dn06CNCS5jJ3Bgu0XoFNo+UzCZb/Ojcio+3A22FujPC1LGCdsBIi/GM=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3686.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075f1918-0941-4451-78b4-08da7b9d118a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 13:26:16.0403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjb4+FZrS20Egt2kF/Q24aWdz1qZC60jjWQasAxZ/qCSBnNx/+z6Q02GdsPEWz2q2nPm5ehN4JhSowDd0GYVvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7521
X-Proofpoint-ORIG-GUID: uhxZn_WUxXxa3VIVMo5UYZtbv6XCoJBv
X-Proofpoint-GUID: uhxZn_WUxXxa3VIVMo5UYZtbv6XCoJBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=742 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110043

--_000_DM5PR02MB3686017F1E5D47CDE88F9BE2ED649DM5PR02MB3686namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you=
 have any problems.

The following changes since commit
ad5ae82019480dc1feffb538c118397a40934e62:

   Merge branch 'main' of https://github.com/suraj714/BT-Upstream

are available in the Git repository at:

   https://github.com/tjiang123/qca-btfw1

for you to fetch changes up to 1ee415b64dc6a057d1c8e82a8fa4236198e0d00e:
----------------------------------------------------------------
        QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00438

--_000_DM5PR02MB3686017F1E5D47CDE88F9BE2ED649DM5PR02MB3686namp_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi linux-firmware maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here's a pull request for btqca bluetooth driver. Pl=
ease let me know if you have any problems.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit<o:p></o:p></p>
<p class=3D"MsoNormal">ad5ae82019480dc1feffb538c118397a40934e62:<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Merge branch 'main' of https://github.c=
om/suraj714/BT-Upstream<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; https://github.com/tjiang123/qca-btfw1<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to <span style=3D"font-s=
ize:9.0pt;font-family:Consolas;color:#24292F;background:white">
1ee415b64dc6a057d1c8e82a8fa4236198e0d00e</span>:<o:p></o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QCA: Upda=
te Bluetooth WCN685x 2.1 firmware to 2.1.0-00438<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM5PR02MB3686017F1E5D47CDE88F9BE2ED649DM5PR02MB3686namp_--
