Return-Path: <SRS0=ZW8P=EX=jozti.co=artemis.ramirez@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D5EB8FB1
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Sep 2023 12:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBFB8C32783; Thu,  7 Sep 2023 12:07:37 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2084.outbound.protection.outlook.com [40.107.222.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6BCCC4936D
	for <linux-firmware@kernel.org>; Thu,  7 Sep 2023 12:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6BCCC4936D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jozti.co
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jozti.co
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiHlou7aawDYSUOR1yULZsTUGE5u/JQUlfAxvonhbw774xVQwaQJdhMPKIZcXw7YaPra7weLh+GtaLNWEcL8GwRN0XVNRpyJIcYyywD9GNKx/siY5zsCPAEVAI34gar9Jnk8AIYJ7wXt8ZkLsfSJHJza9Z2o1KZBh6glrtdNZ5AuWOQPaU0rLn7W/MQ7nTx/ifkT+ocb8IRkkyLM56oA4onLhLZUNwbscMlN6xXz+NkOaLJW+P0TrW4q6sKh1koWvhqdHxAigu1NwNWfQ/S52TX2A56kzbeQGrDQcZ2FimaPQn2v1/EvbF1s5tYMtmPovDoeyky0rU3DeiWLsJuyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew/ASiDGrSXHMdUXqjMt3i2N5mcXcxEvYcp+irJm8Zg=;
 b=AEA/N8pFlaRBV3h2NMbHBg+lF93wFsYhx91PTN88kYl8sNo702xVLETlm1FZDLBSYNORbOT9tdjLJ+uwEdkyqnGCzqlPniZ4FjVGF71Q8lkfeKc/OQ8O9otqD0MIisAfZ5B1QY9ai5t6oCbs/cvs1v6eT3HP8929lyd/o8aPTm8SjnwqP0hcjEOvu54xbnSAU1IRDx1C1D58XMte9WhdqFPO/1MGuZqc3z3XeXkAEY+xIiDOSpLuwWg2geCZl12IfTmuDegEhLaBD4Hxb+jn9+Wh8qZrmUYmrgqgrFtA5Kd6J9BBQDcl6u/wZmEcfwIbxcLrUZU9W7658n5UqRXVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jozti.co; dmarc=pass action=none header.from=jozti.co;
 dkim=pass header.d=jozti.co; arc=none
Received: from PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fa::10)
 by MAZPR01MB5947.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 12:07:31 +0000
Received: from PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57dd:f85b:b385:70f9]) by PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57dd:f85b:b385:70f9%5]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 12:07:31 +0000
From: Artemis Ramirez <artemis.ramirez@jozti.co>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: kernel
Thread-Topic: kernel
Thread-Index: Adnhg96VQ3RQjzJyS7qcNksTl7z/YQ==
Date: Thu, 7 Sep 2023 12:07:31 +0000
Message-ID:
 <PN2PR01MB9570F2B02DBF1388A400B0049BEEA@PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jozti.co;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2PR01MB9570:EE_|MAZPR01MB5947:EE_
x-ms-office365-filtering-correlation-id: 984083a3-3fa9-42a0-9682-08dbaf9b0362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0UOoLofdlKkBya+2rc7LWzZ6hFcrEVhcdeSk4JEh1+pj6zDTVgvcokCGxr+BxR5DR9EBNu4v9bm68YchVrSPKRNUVSdKqtJwK6+zT95eKqYEjo79oyYnlzdyDNtXbZUSYbvtBUmEmJJy3VmoMJSv+od6CXzJC3v8jynROYGSbh6lnnn/Zx2jXqW3zb60NBmM8xKBcdZdG3gVW8448zl1KwV2cn4ls1QDza6Uolwn7sxtHQNhRUMnHMhbnlGOZPeSq5r7HWnB0UHwFEIBb7aE9UZqG3xdqArMvBDRU0Ko+ZZ+xeSr06sPei5g2R8YsdNoHRBDppiEyjTPI0ahqtc5YN9MyZAMUUVVfldx7Yi+CVLikIBXhjePqYFXyQvOLX4yDtA3gtLfs8F2R/7wSM1VAuebqep4TNy6l4mxpMhRrLbF1ydGd1ao/rfCg9zYQXfpevnJqd22E67WBdHaBx6vb+48cox/R+JTifoA/8Tdmp0fEkQ5Ti9cOCP/V/JwdPMe4hNXpWZ0Ap23Mo6kfLCc5b+/Tz0ek16/d/wMB3hQfAtQOoV6ffcVkNxs2Jqavm2nsF0CfvI6tH9APp+sdVJmKDLV6ETr0KNrrw8/yy4v/fWdV1QvKoz4AMzChnjSyy3z7oBTIR2hI4dfe402Ao9LO+sN/pVDUTWSqsFxk2KzdGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39850400004)(346002)(136003)(451199024)(1800799009)(186009)(122000001)(66899024)(71200400001)(7696005)(6506007)(86362001)(33656002)(3480700007)(38070700005)(55016003)(38100700002)(4744005)(9686003)(83380400001)(478600001)(52536014)(7116003)(8676002)(5660300002)(8936002)(76116006)(6916009)(2906002)(44832011)(316002)(66556008)(66446008)(66946007)(66476007)(41300700001)(64756008)(135393001)(220243001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I9l9siRkG51vi+VthkTJxJqlFLxf6o8C+B5BlIRV2VNbtM6ktsMeJsrAY8RI?=
 =?us-ascii?Q?YzWUOuAhjLNkRf8/WJFOe2ydl8uam42206bFb8uQGddtziMoEeQxQAuFwqtn?=
 =?us-ascii?Q?rSQwCtO+m1LfWH+5bmbL1gmZMHarPADgr5c+0tK2rjpHvnm9D+6QgCq7Oon7?=
 =?us-ascii?Q?65xnO2a4Tu32aT+a/4H4JNFwtZLMuCubQo4w7BSsBX8gwdJrniwO7wKZBu3D?=
 =?us-ascii?Q?70sevwQ5fdQYukLn1hSURLuhlAsdbsxY6WvAwV+TRlFjsYf/gcKLLxSosujA?=
 =?us-ascii?Q?sTt1PgkyKXNKAnkcdYuFE0MtmPXpfdmwAAVzEzURDwqIQarje/hgtFHHqz9N?=
 =?us-ascii?Q?q/3ErXMrK6R/oJZdTZ1WzZrKTz7QUo1hNn7S+fPuVjI1vGIRNb/QiPCfB5xy?=
 =?us-ascii?Q?XINjU4jWy+SE/p9bY1jpHQ7LPypJrMnwsGj2rpf9YcVJocKvbcZwOB5TauDd?=
 =?us-ascii?Q?NPZ8K2LdampFJeqXUOwlOxKyV2byK4rkhm4ZXmHxPhKPj9bpqBgDt/j0Uk0j?=
 =?us-ascii?Q?L8OSnBg5vNxY0LP7DcKQH/DqQ5avzAmKEs4lkoDTR4T7UzEJnzxzx4mziaTz?=
 =?us-ascii?Q?TJaqXvb3XQGYePSdILUngkYXzSI9V+E1XeAEc6QMTOGLC+OqUGuGRXp3bqCA?=
 =?us-ascii?Q?HTYbitXr/ozZOG6P1BObHdWvfoDziUtGojY3eF+a5N1d4T7fGfrBdqBvniJP?=
 =?us-ascii?Q?md8JOFLcZANgP7DbZWmIqbGdcCeq6heMa/e5QC/fIJ9SuGXGf61aj3TYhnCG?=
 =?us-ascii?Q?CMc4zvkduw5aA3gnQR+rNJ+0h6JWnWkBTNzZE+QSdU+Xxr90CQK3fETvUcni?=
 =?us-ascii?Q?GZCf7+3DRXfwjKBx6q6UWtCM4tBNeAZsemyqeoRhwPhrJXmqDZJY/8GiKnT2?=
 =?us-ascii?Q?tuhJHEAuncT7qFF3u/sR9vgI2GiYYI0eICHoBHfyUSHsHWxjedh8caBy7c1Q?=
 =?us-ascii?Q?wuM3u6eB0c2/kjbk5LqSNQxQU4xP03YrKa5+YBCUM3IqlF0757Jm7zjkd6Cc?=
 =?us-ascii?Q?OQf5TuMuaHIv/Osm6LsAVJCDFLWSHVxFgdlYAJ/mJdyLNny2MS8drcolvOrX?=
 =?us-ascii?Q?vs+0GcAeUZ+MhkSXyWgmZI9UBs5OAxNvC7txnLzzal/NzesWJCCt/ZURZppH?=
 =?us-ascii?Q?IFsqrOXhkS49p5XXNWEZkIvwAbvT99kUXqbrUNn+KwYxMezaHjulyTjTdo38?=
 =?us-ascii?Q?y40UwY2bEFib6HBgPAgR0eTw2AB3d9WP8b7cFIQfNyRFLDUc7fCxMh461+TL?=
 =?us-ascii?Q?6d6veoQwRLa9n/1gGUZMOboTYt3MP3g9hA5scQKh/KimUJNmyebQUNZ6UMkb?=
 =?us-ascii?Q?Nb69saJUBgCdXUxa/WdTk2t6BlxmTxkGTKhTqSUpVtj8ykr3QJOHR4L/07n/?=
 =?us-ascii?Q?vcvyewmcGBskncKZIKEApy71bOxNOa7Eyiz1hiJH8yyHhIjaQotf8zAIBzuN?=
 =?us-ascii?Q?wF1kmU8qpJ8HxECwUaJNJDQIrsQ0hfVEG7hm3gJN8vae7pecOKMRO0EoEOUO?=
 =?us-ascii?Q?/r9HHU3HaF9em4nUviWqrzVRMIAi9Tp3ztDl4sKZlCuBCfECOl/qKxSKcYg1?=
 =?us-ascii?Q?oWjJoE9B/9j6yU/OZDWn0TIAfvoh4Wyex9t/SQRZF242yCWexilLxqRP3Zg5?=
 =?us-ascii?Q?bER0m+eDj7onFc+1cok/aDaGecf1R61cnYSTBhZxeB7Q?=
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB9570F2B02DBF1388A400B0049BEEAPN2PR01MB9570INDP_"
MIME-Version: 1.0
X-OriginatorOrg: jozti.co
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB9570.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 984083a3-3fa9-42a0-9682-08dbaf9b0362
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 12:07:31.4630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3e1b58fe-8e59-4146-b4ee-fd127fc4b931
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yf0k6ikRte7PGJIdEbzEi4XkDc5TUu7XFHI1ent+fh400ePRdShWslulrA20oPmnz8Vo2I36uo03gsuDT4hw4RnbJHptw7S3p0jK+7Ia0/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5947

--_000_PN2PR01MB9570F2B02DBF1388A400B0049BEEAPN2PR01MB9570INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Exhibitor,

I am following up to confirm, if you are interested acquiring the Attendee =
List

ECOC Exhibition 2023

01 - 05 Oct 2023

Scottish Event Campus, Glasgow, UK

Counts: 1,060

Attendee Includes: Client Name, Business Name, Title, Email Address, Phone =
Number, and Web Address etc.

Let me know your thoughts, so that I can send discount cost & additional in=
formation.

Artemis Ramirez | Attendee List Consultant.






--_000_PN2PR01MB9570F2B02DBF1388A400B0049BEEAPN2PR01MB9570INDP_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
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
<p class=3D"MsoNormal" style=3D"text-autospace:none"><a name=3D"_Hlk1342001=
14"></a><a name=3D"_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114=
"><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif=
;color:#7030A0">Dear Exhibitor,<o:p></o:p></span></span></a></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><span style=
=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#7030A=
0"><o:p>&nbsp;</o:p></span></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><span style=
=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#7030A=
0">I am following up to confirm, if you are interested
 acquiring the </span></span></span><span style=3D"mso-bookmark:_Hlk1062682=
18"><span style=3D"mso-bookmark:_Hlk134200114"><b><u><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#00B050">Attendee=
 List<o:p></o:p></span></u></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0;background:yellow;mso-highlight:yellow">ECOC Exhibition
 2023</span></b></span></span><span style=3D"mso-bookmark:_Hlk106268218"><s=
pan style=3D"mso-bookmark:_Hlk134200114"><b><span style=3D"font-size:9.0pt;=
font-family:&quot;Verdana&quot;,sans-serif;color:#7030A0"><o:p></o:p></span=
></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0">01 - 05 Oct 2023<o:p></o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0">Scottish Event Campus, Glasgow, UK<o:p></o:p></span></b></span></span=
></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0;background:yellow;mso-highlight:yellow">Counts:
 1,060</span></b></span></span><span style=3D"mso-bookmark:_Hlk106268218"><=
span style=3D"mso-bookmark:_Hlk134200114"><b><span style=3D"font-size:9.0pt=
;font-family:&quot;Verdana&quot;,sans-serif;color:#7030A0"><o:p></o:p></spa=
n></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0">Attendee Includes:
</span></b></span></span><span style=3D"mso-bookmark:_Hlk106268218"><span s=
tyle=3D"mso-bookmark:_Hlk134200114"><span style=3D"font-size:9.0pt;font-fam=
ily:&quot;Verdana&quot;,sans-serif;color:#7030A0">Client Name, Business Nam=
e, Title, Email Address, Phone Number, and Web Address
 etc<b>.<o:p></o:p></b></span></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0"><o:p>&nbsp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><span style=
=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#7030A=
0">Let me know your thoughts, so that I can send discount
 cost &amp; additional information.<b><o:p></o:p></b></span></span></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><span style=
=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#7030A=
0"><o:p>&nbsp;</o:p></span></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#70=
30A0">Artemis Ramirez | Attendee List Consultant.<o:p></o:p></span></b></sp=
an></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"mso-boo=
kmark:_Hlk106268218"><span style=3D"mso-bookmark:_Hlk134200114"><b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif"><o:p>&nb=
sp;</o:p></span></b></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk106268218"><span sty=
le=3D"mso-bookmark:_Hlk134200114">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></span></p>
<span style=3D"mso-bookmark:_Hlk106268218"></span>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk134200114"><o:p>&nbs=
p;</o:p></span></p>
<span style=3D"mso-bookmark:_Hlk134200114"></span>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PN2PR01MB9570F2B02DBF1388A400B0049BEEAPN2PR01MB9570INDP_--
