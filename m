Return-Path: <SRS0=us0f=YT=quicinc.com=quic_tjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550CC00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 08:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20D44C433B5; Mon, 15 Aug 2022 08:04:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E395EC433D6
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 08:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E395EC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27F6bUbh030394
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 08:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=YWkUGkqzVKI+8g39xjmmK3BgeiujAIocEHhvA8TNnk8=;
 b=crRRmRcNHSJecYFwA1zRohciQM24HWnEAyidL22URUSRaM4f2WDhDtZ5JjI851J0lYmr
 WwoZKieTKhiOIvPtw9XLDrUp3RmS9aPdbLaHAVxtKYsGHWWd/3xegZPfG7frxZZgJ1qG
 24I6MZsCBkLtF+T35Psi681Nti+wapxxYyMoX3h6wS+usmgI6ChPS78oYtxRst3Y/PGR
 3P695yBVOX4/o1Oe9g8ME8CSUh53K24fgAQbzPVbEx30j2IMJY+Lz+k2oZ+FacnKEIXs
 EZdM3XjL40IBhFBYRao5pNTilW8nJPJNOkia+r7taX7HDbRf71H4sDciJtI6WKuXPN0M Tg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx58f4e05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 08:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqnlSAz+NZHJ37+LUqi2wvNRjUHhy7RGWavrhGGufleis2Sg9jKobVh/Ej+lcl/f7R+AgX1IPU2lvJtx5EKI6BTbwfljhgbaRZ5tZI4LcxnsU6AYY9P823nnKhqF6oesqzohja7OR9N7Acgjh2qw0nKEM1aS4LVw3qPDCb4I/OqUcXPrgk23deiZPgiT+1NiCmpBEQRkXSncdo9JcNWpHfy3YxN7H6EJEC6EsttbJHhIYRZ3u3g5ff8hPyy6EgDl/0Ueu1xwR4Xo7nDEx3OYYGi/er/FlkU+4dh0lUGZikrbsMX3qH0+0NqcFP9UFIcTg2s3CgJ/pz62G1+8K3DjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWkUGkqzVKI+8g39xjmmK3BgeiujAIocEHhvA8TNnk8=;
 b=RRUJZDe0DkwAU3iuC+ahq6FwpyOQB4JofPxwlTZoIVot9+yw/YbAlq+RGA3GdXmXkflod4u4Yg1UHvlU++NVE9DGiuZRkPUhNQlz3WjLNjf3ikx8ltoEQxXAnA12c+7l8ljte29wYdELFSxKC2r4XxCHcnh+iqFmR4D5LMvp3KMPnUR82mO6jR9i6NPsvw2e5afoedyO8kGTpsf7PN3vVt4+4LRbMu2g9HFRVQK/IGLPFLazoT92Uk5zzrv5Hr7NjvxVTmKtjkxKTzB4h/XOZhIZrKitJIWaFv31PyZkbxbi6xuAXAC2FTAY1FjIBds42qMkzWIe2gyTClyw7hHmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM5PR02MB3686.namprd02.prod.outlook.com (2603:10b6:4:b2::39) by
 MWHPR02MB2527.namprd02.prod.outlook.com (2603:10b6:300:43::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Mon, 15 Aug 2022 08:04:41 +0000
Received: from DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::8c1a:a99f:8e7f:e3e0]) by DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::8c1a:a99f:8e7f:e3e0%4]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 08:04:41 +0000
From: "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: RE: btqca firmware 20220811
Thread-Topic: btqca firmware 20220811
Thread-Index: Adithe28qEWH1Ar8QkifurHsG8DY8wC95Eaw
Date: Mon, 15 Aug 2022 08:04:41 +0000
Message-ID: 
 <DM5PR02MB3686865C387271B9EA8143D8ED689@DM5PR02MB3686.namprd02.prod.outlook.com>
References: 
 <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
In-Reply-To: 
 <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2253bd34-3005-4b71-bc28-08da7e94ce88
x-ms-traffictypediagnostic: MWHPR02MB2527:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9BrlER4tWh7Zyclsy3SVFewzLyit+GRJt2V2K3v/9nSJ8sLaRInoOw8Ja37kzF3qUtOZStiEi6OMm/3ykilyp4hl6o0UiGSopU8phNs1WzXM1k92Sua/JmSH4eAc+bw36xCOhu67uRG9IfHDXbK6Iz0bS27KqnvlzgYVHkXABeeg+7flTbkkNUFFjtLWjgA1HnHWppfMlUN5Q/WTU+qFeThgzncWO1B/fM1Um5OroOtOrd32q0sBFn06NW1jjxQxPqm57o+4nUYrpKyNukAaD/VuwfzhAPDWMX6g42AJZEs2VNQDlH4wzAKL25GXNZJgAJezZxEM6fOaAmsJFCfXSp5xDVwpmfsIls/FqIWrcFX8VOYIxWMuTpY4X6i4K6LGGMK6lFx7/Uv24W3mXnBuRwjDmlc+gPPuksDe1/bun1Ci+Vc/BnsWp3VUa+RzeV5kzQ06FubjChcC90McBSbLDYC3NJBLaI8tWe3tl1sNc6Hiy0Eukt6Cj8XOdCN2GgkP4jiKjSCPOeT7eap5gx4eQgkzLlkIE/pXRH/1TvDGRdwnJ5f1NbTPcf1ZttyPuuA7m8nARAY1f5UlRODpKjiHZTn6c/z5/PK3H8jAENPw2WTgwDdjfE0nYufV9ezSn3Mo4oa1Jmd1kgMd4hL9vgj8Gl6Kej1xNF2ockbWyTHvfCF1Y0E20ZwL2Dx+orY3gIXAzf5gD1vRTFSXearH0L3oNyCVfyKWDInMV3LIB4aUpbog7lyLhG0Ov9/u8TsiXq5tWJ7f7s8PWvUBoaXFPWjqSVSse4XGRsrsFU2AlZR5NE/Narslhj9OWl6F3rExu4mZaSe4VOI4HNPG+c07sDc7eJ0j8SkGAkavWuRAMfuboIS7A/OQw2P5iZvHSAn8JPVG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3686.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(4744005)(55016003)(8936002)(38100700002)(186003)(26005)(6506007)(53546011)(9686003)(7696005)(166002)(6916009)(316002)(86362001)(2906002)(66446008)(76116006)(7116003)(66946007)(64756008)(66476007)(8676002)(41300700001)(71200400001)(66556008)(122000001)(83380400001)(5660300002)(52536014)(478600001)(966005)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rqHk37vCrV4NWJ0DIXQaclkvr1jLf5eDk/XoGZ3xJgOXT5lU6rLXrQiDWNxO?=
 =?us-ascii?Q?n+n7p5glwCTuLz7SiZb5CuVziDJ0o1EuZd34xvI3gAdPoFLeBeHGJTKPhiQY?=
 =?us-ascii?Q?FmzIgXQsBttuKy3jCmBlNYEzN3a5rtWwO206JEicRRzCuBFDqO2TmRRM58/r?=
 =?us-ascii?Q?xoxL+EfsDC/yrci7yryzbC/UN5ZJ12wljkTl4r6ABWnFwWvV1ZYgOh/JqOjs?=
 =?us-ascii?Q?a3DP6mtwOOcWVrHxqdJpJ49BqoLW+G//67RrY6wpxoxz5zLw+LSk1150LnRk?=
 =?us-ascii?Q?QPW4RK0N9m4JTHiki5p1ScmuOzyA6KiM50t+zJ0Sfpl+xF4lXUOi57pXTfi3?=
 =?us-ascii?Q?VU22dZUsm0kR+ncIFKMTaELUbdhPB+XUg4yR2vq3by7Hb1h6OSs6w0GFEdLc?=
 =?us-ascii?Q?ns1AKGdOA6tlbZx9HmcE8mrQGnI92piBs3T7DQkW7dkUu4g1y2MJZgsait0e?=
 =?us-ascii?Q?z7sNf1Fz3ILJQ0gQizFsB3/l5XPUECpj5yoXvOrMf7H/Be0ZEOzUxWDI0l5K?=
 =?us-ascii?Q?7WNWQtgrDFK+rgbmNslgDdibVLuoJbt/wJ+9ss2qth7f3by9AuFicm5htEcf?=
 =?us-ascii?Q?W63fTDJYUNH7LdKx5X4SsJud4GPBeWUveMTO6StmhpUza8a49BxlTglEBHz4?=
 =?us-ascii?Q?v/mQVRBSIzXzCNtky9uHCvAA8zd3Es++TQvGBAPtSW9a4zSkgAYC4Ab7Jdhr?=
 =?us-ascii?Q?bUQuNlIeo67Qmrsn8Uyl4fdgziLMcXx0fGDJjN8ovIBol8QPNbMIgmj5NElw?=
 =?us-ascii?Q?9jmClPR5LxUZhJXhN6Y63JwRjLoceybg2U0RGNDQepxwOa0IIORpxdFysMz3?=
 =?us-ascii?Q?HGBOY56MXwJfLIjqDJr8LeVi9Sc6JMzFow12tv9xcKHF7dKib/Kv7C0gE8zb?=
 =?us-ascii?Q?EBhxHVk8VK5EeBgHKcPb4iWtz41V+9yDPiowikEoaW855fTqBRKFugEg6cff?=
 =?us-ascii?Q?AkEdNf9t7THpjQQar7BaF32A7YOAyzA/sWzRqElmwZijr4hdDN5pPfDfADLZ?=
 =?us-ascii?Q?LQtl5RCy4ZZ5yTdQY+jqDhp0NRVEYI/mzydH6T62beZJ5MY4Govystz9pQRD?=
 =?us-ascii?Q?f2ToZbL6byzjqvgbBj/8FDdE3ke6g2iSXct159KovIoRWxjNInOhCoYY+u+4?=
 =?us-ascii?Q?ngNUKL9NYgBP//52JvfBtxrTZv5aXC7QZgDnal9r7Et5GxThwaO2QXqGjbvR?=
 =?us-ascii?Q?hS1RVRbhhUnrMkFYpAq/h7UbaiMREGAeudc5H5G+dukzRfQDEElj1y8uSbbT?=
 =?us-ascii?Q?SExUqFdjfGG7rCLT06yG4Kd6ZiByQv+WfAQ+cCLonjP3HJM6VtMzo7abqD3u?=
 =?us-ascii?Q?EeT3lEAzJG75Bls3Nd63RHzHdrCylNtivrn9GyClIiIFl6Xgj1KMbBSRxRn/?=
 =?us-ascii?Q?OGAfg1GhQYCw3j5U2880cGXd0CUhl+74DZDYQcHTMTUiDAIp2D6A7Ct5Q23O?=
 =?us-ascii?Q?KM+pe/ws5xT+OWYolmIgrjdkPSsn68o5dlz1RU52bQE53xwugDGFfJg+5V+d?=
 =?us-ascii?Q?UC2eMCeQbTaphbIvo2qm/DS8cp8k6kC2Q9WipXwjALduQb+f8G4ANLXHXGew?=
 =?us-ascii?Q?RYZsjw7mWvsDfdZon7frCEfIKHgoeglXwdH478c1?=
Content-Type: multipart/alternative;
	boundary="_000_DM5PR02MB3686865C387271B9EA8143D8ED689DM5PR02MB3686namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	E247iyp1ZgF/ilH5hCT2Wn83N1tZ69lujrrZY8mqbyjD5zwtJAVV/a8uSvhk+G3hkwJLw9jkoayIcapWAYFmJgH+DHqp+AvN/F061MUC0pHAjnDGK6k5K0nJtD/jfzVRzVipWIoZm7bugaDQOD8taek1Ot1khEawYTvE/D7lRW7Upq8IKk/PGi4dY8n0BEjMT3NNPwKgyzT8R6Gnk5FwoT/iwzKiDeKVict7xyr6eQIPg44JoZ6BFgTn5A47Q/AFpAP+tADEBAfwkYCxvkEJAyCRTNVISjB2Gl/VRHKC2w9mDCZGECpMv1tNnSWemHgoDTfkiXdvk4iN3Dll6ZtbZQUmqXrqz0Df2K9yIdTgqHA40WzzNg6tVdCs7N61FVP8a4NRBIVrruwpAxSEq/CxeE0si51DwI7Z0eCn5OufUUTJZvlxWDuBo/X8PaYyMAMQ/JCGc+MEncsMHeqhTPR2ve91XAbWxwjD/lMNiKC5ecTKvMkP4uQ/rGaVgaRDgXj5DnaBDZRNhXHUC6ySnNn1MrshUk7AIr2te4sJlfJspzEz6GbozN0+1ZUvi8VsAnzn/0ikBz30z1Z6q8ikCmPdvfcIIpPMWzI+aI3ghSj3dh42Vk9qFHgSbX1VRIBd1VTo+B74wkziVQ7OEN8rMgPMDo7apBU0z4MQYHo3svbiMH+kCBAKGsOi1VSNxfk+8Dcb9fopxK/x75gZH7PQY5phmBN1RWyOq0MjoCFtFv0L8yI=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3686.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2253bd34-3005-4b71-bc28-08da7e94ce88
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 08:04:41.1048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2C00gCjsqgrTi2QMUvyxRjXEhveskFYdwAWEfRdqXmf5gHxBVEqo05OETzoIBj9SEfm70jnZ3zpGDV9nfMNiEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2527
X-Proofpoint-ORIG-GUID: 5Ni8O7lfmyn2xtp2G7-Vco1lSsRLLqsN
X-Proofpoint-GUID: 5Ni8O7lfmyn2xtp2G7-Vco1lSsRLLqsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150028

--_000_DM5PR02MB3686865C387271B9EA8143D8ED689DM5PR02MB3686namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Linux-firmware maintainers:
  Any update on this ? thank you.

Regards.
Tim


From: Tim Jiang
Sent: Thursday, August 11, 2022 9:26 PM
To: linux-firmware@kernel.org
Subject: btqca firmware 20220811

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

--_000_DM5PR02MB3686865C387271B9EA8143D8ED689DM5PR02MB3686namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">Linux-firmware maintainers:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Any update on this ? thank you.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards.<o:p></o:p></p>
<p class=3D"MsoNormal">Tim<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Tim Jiang <br>
<b>Sent:</b> Thursday, August 11, 2022 9:26 PM<br>
<b>To:</b> linux-firmware@kernel.org<br>
<b>Subject:</b> btqca firmware 20220811<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi linux-firmware maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here's a pull request for btqca bluetooth driver. Pl=
ease let me know if you have any problems.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit<o:p></o:p></p>
<p class=3D"MsoNormal">ad5ae82019480dc1feffb538c118397a40934e62:<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Merge branch 'main' of <a href=3D"https=
://github.com/suraj714/BT-Upstream">
https://github.com/suraj714/BT-Upstream</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; <a href=3D"https://github.com/tjiang123=
/qca-btfw1">https://github.com/tjiang123/qca-btfw1</a><o:p></o:p></p>
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

--_000_DM5PR02MB3686865C387271B9EA8143D8ED689DM5PR02MB3686namp_--
