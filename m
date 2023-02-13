Return-Path: <SRS0=J/yk=6J=oceanedigitaldata.com=alicia.alvarado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D25C636CC
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Feb 2023 06:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AFBBC433EF; Mon, 13 Feb 2023 06:11:37 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01hn2235.outbound.protection.outlook.com [52.100.223.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97109C433D2
	for <linux-firmware@kernel.org>; Mon, 13 Feb 2023 06:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97109C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=oceanedigitaldata.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oceanedigitaldata.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L23/2+VJJyf0kVSCrljCXCpNPKFUAeQOrPQ7OzNk0EgusMZXGYarX8VFPdEWI9ZphT2wQRwkbKMk722phv7dqE5jp2N8oO9c+x3pSfBwiPswkaGSKWhcHSWaNjXceKrOm7cUaAypNg/TEstR/OF6VfvZU+fzcW1W+Ys0/5ulETz0VgnVWg/72eALA90tj9qX7ZE2sZgepmZjUAvjlAT56b5dRtQaQ3eihJAuftMt0dduYkMwF2zVGHpzwFg0h/hzobtdCi6j8iokW6tFHaZ2++o2V8qAqOwsC3kQ9gpEmjQWSC6iknQshF0NL7UGR8dSi/i7ZRaXjq2rercO+nZ35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8+pM2OwXAryY7asngBefkvsatMbuFfidH0LXXRVJkA=;
 b=GpkgT6I0y9GVjAJKqVFwmMrZzqmsAKZlAY5Z0iUgtvDolBwUY4kAECIBSYvLj7wFa/cR3o/8G21rY9AWYTPy8zzfYlqziiKnJuoZzAG9TKg8Gwpy2WA3T397/DVeaCfljxor0tvjU7Og50ZmJvHpH6T0wFR8q7jQXounlZ5nUjz7GKAiEomr29IouIyMb7kipFP8/+UIDAcfbJqClryXoDklWW884qxuTEPwyYH5IBspPkEJCBtTUyRevHsoQl7j3WQAIRDsmZ/ksHGOo1PLYj1XZoKh+KpRnem8c9Scl4W842lv2jZiXTaBpNwFdK/Q6yAz66iIHvUlllR68cHMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oceanedigitaldata.com; dmarc=pass action=none
 header.from=oceanedigitaldata.com; dkim=pass header.d=oceanedigitaldata.com;
 arc=none
Received: from PN2P287MB0523.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:112::7)
 by PN3P287MB0148.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 06:11:32 +0000
Received: from PN2P287MB0523.INDP287.PROD.OUTLOOK.COM
 ([fe80::90da:c17e:5ac8:d395]) by PN2P287MB0523.INDP287.PROD.OUTLOOK.COM
 ([fe80::90da:c17e:5ac8:d395%3]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 06:11:32 +0000
From: Alicia Alvarado <alicia.alvarado@oceanedigitaldata.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Topic: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Index: Adk/cgSevGO9Vc+SSXWazxNvNHkNtQ==
Date: Mon, 13 Feb 2023 06:11:32 +0000
Message-ID:
 <PN2P287MB05236FCD9109DEFEE546E661FFDD9@PN2P287MB0523.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oceanedigitaldata.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2P287MB0523:EE_|PN3P287MB0148:EE_
x-ms-office365-filtering-correlation-id: 8a3292f3-0297-4d26-e8bf-08db0d89276b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/xtP61Gc9flhh20sOp9NtTNu4GkqPVOC6x1eEDRzkqhDKEd5btccUdJfrl?=
 =?iso-8859-1?Q?W0k38Dho4JyjDel/deQpQe88AY54i5uEKeO0HCNWZ7TegMAEk931urQVpH?=
 =?iso-8859-1?Q?DC2LsI6B9PiNUZ7NZvjwjyVp61m35GphlrQMSmU0j0JpsyJfKGjlauPFxA?=
 =?iso-8859-1?Q?Xxr0RTZDR3H5aCYm6EWBqaBqAmfMcAshyniv5lhVBpZP66QQpoPPRb3TjQ?=
 =?iso-8859-1?Q?r/gRVv82YDqx+xB0PIy7H8nlwf5TGzg56UJ4BEZ3U2khSK8eFf9Rn5Dw6B?=
 =?iso-8859-1?Q?vJoEtYn31Nw2mR6aSKW5NXRwxZUkHo6gcNznutHBEG5/iAPMY4f6UQAcyx?=
 =?iso-8859-1?Q?sBRgZmQ2t7pUzc0/VK5S/IN6QXJ6L5EUpwO3z97v4S1p5Lw27Wi0e+yPtk?=
 =?iso-8859-1?Q?9exh603x62/0lZ1mFoQIh796G2HOoOhKBs6y2/3orS6t0FaW6IvN1IBsFI?=
 =?iso-8859-1?Q?iIRibQTH8oDN9P0m2lPHmWjSr4JV3184xH7Hh50Hop82DaH23H0LraVlSX?=
 =?iso-8859-1?Q?dtzcftyb1kBFNTm8KyPp02i8m/1jbvQq4KUiJsVHu+D//dtPFHcVsCxiqD?=
 =?iso-8859-1?Q?WMnky44gHamrlFaz8x9tGWGuRJJTwufGkgMHE+osMxLCGQG/+1eI7KA7Ej?=
 =?iso-8859-1?Q?8JFV3utLoTGpNko+X6mMQ4rXzN5VYcCL2UgSmtc+uAkFv0gp9nkOBsfpze?=
 =?iso-8859-1?Q?Rt+FGQ5hrW+ZdYSutgicyJPbRp+qZ5lU8gdl1yQJ7J4p76DqGn6hTmvxvu?=
 =?iso-8859-1?Q?LdhdGD8I4+YHQvZ13nJ8debgd4O26CFQNvTzG8ETI/Z90WqL7Xss3u7Gnu?=
 =?iso-8859-1?Q?s8BcXhRYJ4nARGQ0pt161wf/XRY5KG6T4u4Qa+mUKIZYJImjEVkK2PzwLE?=
 =?iso-8859-1?Q?x0XYljKfUEf2slg2LGpvCb0gOpfrrROSzlKJ1W3g/88BtKamnIHqtFh4ZB?=
 =?iso-8859-1?Q?qfxZ+2AbImEXPVEEVrl7RizszhAZjDsNm46gvybupMykVJn4E3f2xEYtGO?=
 =?iso-8859-1?Q?OUuM7od0x8FT2Bqu0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:PN2P287MB0523.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230025)(39510400003)(346002)(366004)(396003)(376002)(34096005)(136003)(39840400004)(448600002)(451199018)(8936002)(52536014)(41300700001)(55016003)(2906002)(122000001)(4744005)(5660300002)(83380400001)(38100700002)(44832011)(26005)(186003)(6506007)(38610400001)(7696005)(586005)(86362001)(71200400001)(64756008)(9686003)(6916009)(66556008)(66476007)(76116006)(66946007)(4743002)(38070700005)(66446008)(33656002)(131650200001);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NyVTk5yq6Uo1J2LrCY/acYQURSbq9rSJiBfCeb8WwNI7WbROYszL/Jvbia?=
 =?iso-8859-1?Q?aJKCaotus29agSJTYqBVuXE5W4+ZQexqHGCZI36kIBsNPqgK/lC2V8GDZ2?=
 =?iso-8859-1?Q?ZlPyibsv0I452whHzoJU6INZrqDIr8S23Pbp5kHFUjFig2zXF3+wlMfEb+?=
 =?iso-8859-1?Q?CRIb2x7NiDVDLW59SNvxOtwtqY33Wx9qOUnjgBudSZWf0EFbg45KusOhWB?=
 =?iso-8859-1?Q?BKmhAEfTPSn8/YteQsyr9Ba6df1X3+Qy89Cpl+9+B+0We3V/JpjE5gWn6/?=
 =?iso-8859-1?Q?jb/C4Nf0b554ydg29e9ry/uZB1PMHM84PrdHRetwtYr9WHK35RUa3+qSSj?=
 =?iso-8859-1?Q?EZmekW6KgIOizkOv1/K2gEKapEixwnPbmsytaQu9IVo/1bV/0iP8M2Thf3?=
 =?iso-8859-1?Q?uHCatEcA1c5rHEPsOiYlLuP8X2RrV5icDzzecQv2nn0KXNIOAyVgd9F8n4?=
 =?iso-8859-1?Q?SRMVW66cTnC3iiHOmhRAOOIlfsqbEVx7Bb/Ot523Ub9Kz2dLqHCzcfHgTO?=
 =?iso-8859-1?Q?ySkG71k8+kxd2EOzQSBFyuAKuf2aYUgv49r7RuBMGirJcJnYhxiNTiYJtn?=
 =?iso-8859-1?Q?ZBQI25je8ccKR1th2uEf8r8iPWIsC5kkeUGJwMpwQb+wfNF1HvUUigfncI?=
 =?iso-8859-1?Q?H0JGgf74IGuiSZF68IwgDBoTtQBJcsNCPRMFwbxutg+uRE9YQKILjsw0zF?=
 =?iso-8859-1?Q?u0eonlXlqoQ/HEXsW0uFfh1clhkoUd/MCaVnNRCsLf4PL0m/wRqgDLcjf6?=
 =?iso-8859-1?Q?qoKz5ajeIBmE2SZv1hWGXXRcgtmLhWH/n9L99715G9qvGxqkoXKVii12Bl?=
 =?iso-8859-1?Q?jW1xb99omv6QKKrB1yTY9337m3KNDrDwVFFGisHHpDcBVhbEw69BmJRTm0?=
 =?iso-8859-1?Q?2A6dTP3jsmykGSMY4Y7iSFqCSc8bouquIQbrWtB1TtwuzyJus4CYdiCJG9?=
 =?iso-8859-1?Q?Z0RQS+VAyCMlo+WtvRXByqg0uU0Z5k75HKvY4Go/aHyChT4zkkfImTNYtA?=
 =?iso-8859-1?Q?RPhWUJzS3ZBtiEsmEmW9qJUY3ClFynOo5FrhPwtB6VZPJ84/gL4d7jS8e8?=
 =?iso-8859-1?Q?SQoJuEoFEk4uFr8i7XfBUo/KoBXLBfYnhxhdXx9+OdnH7bHWBTcwTUdOAN?=
 =?iso-8859-1?Q?2jNWr2FN9PETDMF/EFBFV9tCLDTcDMAfc64h8E8xTpzVhOv5Wt3mr5CCRB?=
 =?iso-8859-1?Q?+uklsiOnLlWyIhaCoIzkVH3TMQujcn+/A49YGCYHRmo5fFXNMn/3v+Cgx2?=
 =?iso-8859-1?Q?HQ48P3FGaqLLtVLNwKCiGg1qcPh3aOBNchPFUfFOC1nkpIXNKx29X+jyDj?=
 =?iso-8859-1?Q?ZqYUsYNH+VLUHBQup0XxNX7Gl4VaHpZOqXW9tGbbS3yxpRVa/WaJXQ+ivR?=
 =?iso-8859-1?Q?fDPcrGB7ylUwnYP87LKmG0SqCexJSlDLhJjEwyk+1NP6ri+af4WTG8wtlB?=
 =?iso-8859-1?Q?66O7tqLjX4FBFSf7ebVYVhRFa+WwPS4rOnNViL6RNIXf/vUWhJRIDAiLKo?=
 =?iso-8859-1?Q?qJlfUVoIWBZnuGu+mDieXZ3phiL97u52Cn6f2iMxr2G4FadTz7U6asrWYL?=
 =?iso-8859-1?Q?6MIv9hFKlD7ixrgM+0lf+dUAn0zmVo8JyG10ljm/vjJkM+qFcYXG2woAhr?=
 =?iso-8859-1?Q?Ot/8wJALvXxFWIss/b2GUxcrgGhfdASAwFKGuFdef/q3IlDWO0h5aNTaq3?=
 =?iso-8859-1?Q?RElsTdQq3aUZBf97rSs=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN2P287MB05236FCD9109DEFEE546E661FFDD9PN2P287MB0523INDP_"
MIME-Version: 1.0
X-OriginatorOrg: oceanedigitaldata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2P287MB0523.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3292f3-0297-4d26-e8bf-08db0d89276b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 06:11:32.5964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c39565e3-c296-42a5-9ff8-51ed60581af8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVRF2fUx34wI9jDmNwO/lJrsI43nmssF4XkU+451ctSekIBz0YIQ8az2j67AIDAsMnjigmvWwDvb2EQydWcMEenTHH4QViRZJu5iwQTnWxbWnP1vgFcEod0SjanpZ/n1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0148

--_000_PN2P287MB05236FCD9109DEFEE546E661FFDD9PN2P287MB0523INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I hope you are the right person to discuss about "IDS 2023?"
Our data consists of: First Name, Last Name, Company Name, Web Address, Job=
 Title, Phone Number, Address, SIC Code and Most Importantly verified email=
 address.
Number of Contacts: - 58,000
Cost: - $450
List will be provided for unlimited usage.
Interested? Email me back, I'd love to provide more information on the list=
. Good luck with your booth at this year.
Thank you.
Regards,
Alicia Alvarado
Marketing Executive.
If you do not wish to receive future emails from us, please reply as "Leave=
 out.




--_000_PN2P287MB05236FCD9109DEFEE546E661FFDD9PN2P287MB0523INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:105%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_Hlk126695035"></a><a name=3D"_Hlk1267619=
24"></a><a name=3D"_Hlk126695658"><span style=3D"mso-bookmark:_Hlk126761924=
"><span style=3D"mso-bookmark:_Hlk126695035"><span lang=3D"EN-US" style=3D"=
font-size:10.0pt;line-height:105%;font-family:&quot;Arial&quot;,sans-serif"=
>Hi,<o:p></o:p></span></span></span></a></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">I hope you are the right
 person to discuss about <b><span style=3D"color:#C45911">&#8220;IDS&nbsp;2=
023?&#8221;</span></b></span></span></span></span><span style=3D"mso-bookma=
rk:_Hlk126695658"><span style=3D"mso-bookmark:_Hlk126761924"><span style=3D=
"mso-bookmark:_Hlk126695035"><span lang=3D"EN-US">
</span></span></span></span><span style=3D"mso-bookmark:_Hlk126695658"><spa=
n style=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk1266=
95035"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font=
-family:&quot;Arial&quot;,sans-serif;color:#C45911"><o:p></o:p></span></spa=
n></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#17365D;background:yellow">Our
 data consists of: First Name, Last Name, Company Name, Web Address, Job Ti=
tle, Phone Number, Address, SIC Code and Most Importantly verified email ad=
dress.<o:p></o:p></span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#833C0B">Number
 of Contacts: - 58,000<o:p></o:p></span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#833C0B">Cost: -
 $450<o:p></o:p></span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">List will be provided
 for unlimited usage.<o:p></o:p></span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">Interested? Email me
 back, I&#8217;d love to provide more information on the list. Good luck wi=
th your booth at this year.<o:p></o:p></span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">Thank you.<o:p></o:p></span></span></span>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">Regards,<o:p></o:p></span></span></span></=
span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-f=
amily:&quot;Arial&quot;,sans-serif;color:#C45911">Alicia
 Alvarado<o:p></o:p></span></b></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif">Marketing Executive.<o:p></o:p></span></sp=
an></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span sty=
le=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hlk126695035=
"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#F2F2F2">If you
 do not wish to receive future emails from us, please reply as &#8220;Leave=
 out.</span></span></span></span><span style=3D"mso-bookmark:_Hlk126695658"=
><span style=3D"mso-bookmark:_Hlk126761924"><span style=3D"mso-bookmark:_Hl=
k126695035"><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%=
;color:#F2F2F2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></span></span></span></p>
<span style=3D"mso-bookmark:_Hlk126695658"></span>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126761924"><span sty=
le=3D"mso-bookmark:_Hlk126695035"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></s=
pan></span></span></p>
<span style=3D"mso-bookmark:_Hlk126695035"></span><span style=3D"mso-bookma=
rk:_Hlk126761924"></span>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PN2P287MB05236FCD9109DEFEE546E661FFDD9PN2P287MB0523INDP_--
