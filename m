Return-Path: <SRS0=kREF=QD=kufarabb.store=hirschkeshav@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3662CD5BA1
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Sep 2024 09:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4D77C4CEC4; Thu,  5 Sep 2024 09:40:27 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2102.outbound.protection.outlook.com [40.107.239.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EDE6C4CEC3
	for <linux-firmware@kernel.org>; Thu,  5 Sep 2024 09:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EDE6C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kufarabb.store
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kufarabb.store
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIozh2tr/hKm9TBIaVBpIVayKdVKAQw/xbGoctaDH+ZZBP1GXsEXyuSNcUGjAVvzyumlS4M/ZKPXRI94JVkzzitw703dZHgrHRVEhq9IOOnEp9yCNtA8QMnT17JvpwnDTv/6lKC+dPtrGucJ0JjoHVu7Beeg9erMIqM8gC6hxPn7W+df6uwSjfYQZ1JOselEPTDmBrHiD5jODWZjI/D8MLmYCGOKNJPzQclR7F36tyrVrBSJAjYGGx5N7kkhWLVqCWyMpHDTeA58ICnqnewS9AneCpvMPkWXdbqB3wDG78AFTDKNVLWozFwxaucfiVwO2sIWVwyyq3zRON8ALUICrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r3vFvzZzbV3pKdMW7tJT3jJnGfsgUAtKEyf9IFigQA=;
 b=MnAE2vTdtlemkhA7HeQy5BBCdQPLxcTPzjO2GVvHmb9jSVIJAKvPsVU6ZhsSqNaT9QjgNRb/TiGejJ375GWOPRNKha4WLYSWctMFJjE42w5wduRlKTdQbaz6HrGEVgHU04Hvm99FXVVdsR5IdZ9uZF3yOAD/C6IoIg1UocSImF7i5P1jt8KW3dglmSVz2Ny6CBfM8AHlU+jBPXqhkC/Yf/wt+7GIjmXf2727GLcZxsgFlNDxRxpBAlzOhOSuEuQl7GoqC552bP1Q5HaAxCU+sr3AScLleEz5PpD04YXVtNO1MUDAekRoO+RdyDvXOEIvfHXqqIFWKMHBJxVNZZGsLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kufarabb.store; dmarc=pass action=none
 header.from=kufarabb.store; dkim=pass header.d=kufarabb.store; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kufarabb.store;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r3vFvzZzbV3pKdMW7tJT3jJnGfsgUAtKEyf9IFigQA=;
 b=scPGfqG3WK1jOcWeUYtOtCuI/hKPxwI/i/qHLEVa5s9FdB+CshZjeue/UuAmGYeBaAO20Nm5/9DOUiKcGUn7pN32P0cqXKZELZx7tjiW0XDiQZsaXXjw7u2koDnL3Cqtace9SPxN5vIr+bL3n4hVE00Z3TC9o5kUo5mQH7Kkdu4fjY+FIrCYyQERbI6yxmurxpfGAwnjPsLFkhCw1/2nNdZK23ehzTGta4I5VGATuxD6achwAhDF62rWWoKHI+wufS46L5/KbRXIi6Cp9Jsq3Bt67HBBALQkuaLsUIgnbwsI8tnOIBI20n2Elv3zbFyOa3au6iY5uO7DCsnCG4lvHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kufarabb.store;
Received: from PN3P287MB1607.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::6)
 by PN0P287MB0921.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:145::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 09:40:22 +0000
Received: from PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 ([fe80::96d5:cd12:f455:334d]) by PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 ([fe80::96d5:cd12:f455:334d%6]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 09:40:21 +0000
Content-Type: multipart/alternative;
 boundary="--_NmP-15cbdd0cad52dac1-Part_1"
Message-ID: <3c918f70-5a1d-4b51-9dc9-d2e61c7fa05c@kufarabb.store>
In-Reply-To: <605f140c-65c6-4eb1-8393-458acbc22311@kufarabb.store>
References: <605f140c-65c6-4eb1-8393-458acbc22311@kufarabb.store>
From: Hirsch Keshav <hirschkeshav@kufarabb.store>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: I can help you boost conversions
Date: Thu, 05 Sep 2024 09:40:17 +0000
X-ClientProxiedBy: BLAPR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:335::11) To PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1607:EE_|PN0P287MB0921:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a50644-57c9-4af2-0e8b-08dccd8ec2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|586017|376014|69100299015|1800799024|366016|83080400003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFdHZUY3blgrWGxXZ1VDM0Z4S2kvdThLSkorV2ZqNEFSd0xWTWNPK3RuOTh1?=
 =?utf-8?B?Rm9WeFJNNlFKdlBKcWExTm5TRnNYTW1lMU5ta0RSUXN2Z1ZTa0hkSkw0ODUw?=
 =?utf-8?B?UWlKMTRuQkNYemNOeGtBNkJQdEU5cG5wKytId0FuYlkvd1A3WmlPVFNWc2tl?=
 =?utf-8?B?M2luWWRpNU1WSTJhNWt2TzdhVkk2VEplemUveWR0ZDdYeFpUdjlKUVMvOUFU?=
 =?utf-8?B?STRNL1laaFJVTEFpNnJXQjh2ZmZEZEtua055QXJsWnNCNGZBbHNRcFpPMk5s?=
 =?utf-8?B?Nk5qK1RWdHgwckpDMWhBUkRrN0pCK213TUhyc3dZQ2ZCZ3l4c0FoOUkzMm84?=
 =?utf-8?B?bkN1S1kzazhSR09ydmpXNG82ZnhaaVdrbG5Kb2ZRZEJybkQwV3FYby9wTndp?=
 =?utf-8?B?Q2VVdEwwSEI3TGVaeTd2YmpxVzFKTVpvQmJWS08xU1QrWEVxcnMyeWNEZlVk?=
 =?utf-8?B?VGJlZVlKK1BUNWJBNURxV3RpN2llTFVHNGJGN0FhZXBtWUo1NXlyTGNxVmtt?=
 =?utf-8?B?Y1U1Y003UnhRajE4bFVtb2RGc0xQZWtqK1ZHNVNBUU1xMi8wbS81OFJSY1Bn?=
 =?utf-8?B?UkV1b3RhcDhsc2FQM3lYQmFobFJRdkdYSUhnOVV5U1FqVjZLdlVFTHk2c0F0?=
 =?utf-8?B?bnlMWjN2cGMrMllMTU1HalkwbURIY0ZTdjBDempVQW1rYy9LRTFYTW85bzVu?=
 =?utf-8?B?eUVsVkhKcDhMS2ZOeTEzbmNWZVFSa3c1RUxpWjFCYWxWWVVmY2s1MFdlT1ZT?=
 =?utf-8?B?c3ZWb1c0VEpMeEZiSjlqZ2dJR2tERnl3bVVHTVYrZHpWMmcyNk1SeGFNaE9D?=
 =?utf-8?B?eklIR1BuOWIyQklXTGFGUjBVbGUxWmdxb2JnNElkM0ZiRVBoREdNRFh5M0Fl?=
 =?utf-8?B?cWRqUEhpa0c5YUZvVUt1TEpnVnRuMndqUzhKRC9qK3lXYXRQOUJZMjcyQS9T?=
 =?utf-8?B?aDJjMzFYclNCSjhMMkxuaDZKZFdrVWpnRVN1M01UZ0txMTl1NlZuamZSY0RT?=
 =?utf-8?B?YStGTkpsOWdFQjZQVXBVSHduSC9MSmN6UnI5TVlYVGFRUm5FaWtvT1I2NHAx?=
 =?utf-8?B?VUhkVmx4dmRVNkhXWUQrRGN0TDdwRmc4M0hMRDJ3b1lNWkdyOHAwQTRMeXlZ?=
 =?utf-8?B?R3FzR3YxNjlUVXlaOHJ1bUNNUHlEb2xhWDFvRkc3MjNnVTQ3NVJpb0xNTFhI?=
 =?utf-8?B?Ym4zK1hJbGNIUlNjN2RhTG9mY2xDVzJ1MnB1ZVkyWmV0dzEyak9NcTJ3bUlM?=
 =?utf-8?B?endBdG45bnBjOU84cEtTTEMyL3NXOU5LQWJLYXdiYnBhYmJuWCt3cS9MYXZ4?=
 =?utf-8?B?QXdyQ1k3dnpVdStoTVl2UEt3ZmRHb0RndFpyK3lkYjFoQTk1VzVQSG5sSyto?=
 =?utf-8?B?V25ybkpJSElvMTE4K1lUTTdzWGZEUTBLTGowaUNpaHh4L0RaOUVsNG5CaERP?=
 =?utf-8?B?VEpIdEJrSlpwSXg4dDEwVWI5STV1Wi8vWjBaS0p1N2hrSXkxTWt1K1hUemxv?=
 =?utf-8?B?WXlMRG9YeTU2THFIWHFMM1Jza3d6dHJXeTR4Q2pia1VSQ2d1WHZpR3JMK21z?=
 =?utf-8?B?d2xKc2ZFV2I4ZERxclA2dUpHdDN3ei9vdG1tZGpyNUdEZGVFZFJVNEN0OUl6?=
 =?utf-8?B?UDhCSjllai9tYVIxMm1ISGFISDlJZ1Z3TWpwamt6MFdVV1RLQm1ZYUExeHkz?=
 =?utf-8?B?aGppeGFleXZETXRCMkdQK0xwRjZ1U3dpN1VoY05PUUNzYnlMUDNQczltY0Zz?=
 =?utf-8?B?aG9DYzJ2K25tM0xqaGJpQkVNVXM2OTZ5WEJFeWZCcGdzZElGcEJwc2pTaE9V?=
 =?utf-8?Q?93UiJ7sFRKbwldaiJnTg7mT+qCAJUnDYxc4aI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1607.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(586017)(376014)(69100299015)(1800799024)(366016)(83080400003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhkWVUvTFVDSTA2eDNWZVkwQ1NXOGpVcUdEcFowTURPVlFzUGVEWmtwY1Iy?=
 =?utf-8?B?UVd0MzVISlY5TWh4OTZCbGdBTVhqVHBiSkt4L094OUVIcGt6dkd1Y0dlSHl6?=
 =?utf-8?B?SDNJd09wSXZQLzNtUUFDUW5HTEFXVlFPSWNrU0pWckZvWFJCUnVtTTE2d1U1?=
 =?utf-8?B?SWpycmNZZmR0VFIwY2VLRk5LU1EvWXVUN3ZMWGg3S3g1RVlHUEY2ZzBDMUtk?=
 =?utf-8?B?bkl5TFhMYnN1NTdiWjFRWmdoYVZOMEVXaVJQclF2UGRQWlVPOUVLanRqaSto?=
 =?utf-8?B?N2Q4VnNPM1ExdmNkdjZzbzVPaGcxWUFvQXo2cXhKWGF5dTJMdDJSczlnRTVN?=
 =?utf-8?B?T09LVEJGMmNRWjQ3STZINFh0K0kxYWNoWFJrbERDcjNIdTBnMTYrRFc5MUov?=
 =?utf-8?B?TmxhSjJWYTh4WUQvcVErbG04QjdOVlJqWjVVRWdpbk9GVVJsait2Z21kZE5J?=
 =?utf-8?B?VHlpZkR3akplOVRjRkxiOFVXVW1WSFhURHFobzB3MFhjL2phMjZGYW1ia0Nv?=
 =?utf-8?B?Yk85SmFjRHo4blR5eUVwczFmenA2OTN2eVd2SGZGT1llVjJ0Y2lOZkY3QlZC?=
 =?utf-8?B?QUlxT1hLSUUxVEt3T0FodU9wbll3bXhuNGtscmxGYUw4VUZPVy9yTVFPTFl4?=
 =?utf-8?B?U3FSbDIwRkQ4bWtrVmdvVVFISU9aVjQ2R0VuRWNLYTU2dXNSK0dMNEIxWlhQ?=
 =?utf-8?B?UzFkWkEwT0d3N05LRExqdm9lYVRPNTJHVUJyNjdCUmJhemlvY0ROSDAyRkx4?=
 =?utf-8?B?L2xPRi94WE1Xci9Cc2tGOEpjN3h6ZXV0L01XVmJlL1RYOHUxUWFqVWJiMlQw?=
 =?utf-8?B?Y2wrQ1lkVHpHYjlHbUVzRHZpSkp3TzFCVXUvUDBXODRCc21oREg3MVIxOEhU?=
 =?utf-8?B?ZEN4T2ZGSUVpYW9tcVN4ZXR3bVE4dW02TjVZbWZvallLRTJOTERuSUNyM1Rl?=
 =?utf-8?B?andOOHhrREZzZ1VuS0Vvd0xHVSt5QUxKdEVVa1VVRURLcHBuUHM3Y2RkcGZF?=
 =?utf-8?B?aVkwT21qbTJzczR6SHR5cndaNUtCMDljQU9aU1hnMjM3cDFjWURZMWttNU9X?=
 =?utf-8?B?NGtMMTYvSlArSUR6ZVFRb0ZsL0J2STJLTDVMbzdaVHRkcDIwZjRWSFoyVWpT?=
 =?utf-8?B?U1RlcytPVWltemhPZ0F6T2hCQXVnekdIMERLV2duRlVVNmliOUxzK01tRDBD?=
 =?utf-8?B?RlRPODcxOFFkL1pkYXk5RkFhMWdPZXY3T1FXdzlPZENzbjVsNkdxQWdsUXJ0?=
 =?utf-8?B?RHdhd0EyTllMcHUzWFBGTU93djlNcWpPME1uWG9rWFRVTWtIamNRNTN4bS9M?=
 =?utf-8?B?L3huM2dJQ2thdWpXeWVKUVZQSmpPcG4ybCtmOU9yZ2piMldhaG5wY2JRelEr?=
 =?utf-8?B?Q2FEbkliZ3BqbXE4TEpxNXcveThkU0pHMWdGTldMTTRKMjNZTUpLMDltYTA5?=
 =?utf-8?B?dE1ZdXNuc3F3YW1ob3h0MTVZVHNCM2FSd1VsZWlTd2l2SmEzcUZGLzd4SzU4?=
 =?utf-8?B?azJoWGt4VkFnMDQ5cWxVM1BDSFZQQmg4ZldGM0dpSmNLNTlzd0drK0xDclhO?=
 =?utf-8?B?bml4M0JYajI2S2I4aXNmUi9mN2FpRlhnb3VvMHBIVThKdCtPSFVTbGRRSldr?=
 =?utf-8?B?Z3pqUHhYSHVzS2hkc1UzVnNqdTZBbnR1U0RrK1cyUGQxL2FNUjB3Sm1wNlFr?=
 =?utf-8?B?dmcybmN1TEp3czlBRnVUZ1h2NkhiSU9zckJodWV1bjVpRTNxbjVka2p6T2hv?=
 =?utf-8?B?MytKM3lWdXVLY09wdCtJV3JxQnJ2akt3SjQ5SUFHRDNLOWNCN0FZNW9Ybzgz?=
 =?utf-8?B?bnhxQU1ncDhNenVkaENsa3dOc0RJYUhsQnc3SFpzaXJiaVVFQ2FEcGN0REdw?=
 =?utf-8?B?TTRkblRCcktnYlZ0Nng3eTY0U0prSGVjRXJITGcwQ3JPSGdub1JJdHhtY2JS?=
 =?utf-8?B?aTBLRG94eDhmMU9kREFpc2owQU5BT05xMytEQXRDQ3JjTFB1aU1XSTlFbGdF?=
 =?utf-8?B?VjZvdVZSc0JIa2FqYmpzbjAxQythYWdUZCt6TlJ2TE1kK2Ivd2lEc3UybUtx?=
 =?utf-8?B?UlF3N3U1UEw2RU1NL29venZrWFNSa1JlRmF1ZGdzRFZ5K1pGazNKM3VRNGdj?=
 =?utf-8?B?Y095TFkzbUpVVEsxSzFScTR2SkdXbUtPaWc0TlpvT1REVG1JbndpU0JEOXN6?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: kufarabb.store
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a50644-57c9-4af2-0e8b-08dccd8ec2e7
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 09:40:21.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9ec9e66c-90c2-4481-ba6d-6a197fdb6be2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxUTovnA9USxowjTfmyn7+HVRSFlmJ28hga6sTU7wR77d/V6TXFT3hz5A5XlKUkgurFPlMGkFUC/KE4U6f4m1OEsbQMKve8kG98rqY0bomA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0921

----_NmP-15cbdd0cad52dac1-Part_1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Let's do a Free Audit, and then we can talk?

On Wed, September 4, 2024 =
9:42 AM, Hirsch Keshav <hirschkeshav@kufarabb.store>
[hirschkeshav@kufarabb.store]> wrote:

> Hi Redkey USB LTD, been trying to =
find your email lol. I know this is probably weird but I thought I'd reach =
out.
>=20
> > =E2=81=A0I saw your product and I was wondering if I could =
help you get more conversions to drive adoption, free of charge just to get=
 my name out there? I=E2=80=99m an app product manager + UI/UX designer and=
 would love to see what I could do for your business!
>=20
> > Hopefully this is something you're interested in... let me know if =
you're down to chat!
>=20
>=20
> Good day,
> Hirsch
>=20
>=20
> P.S: My 3-minute video would put you 3 months ahead. I promise!
>=20
>=20
> Sent from my iPhone
>=20
>=20
> Quote of the day: Opportunities don't =
happen. You create them.
>

-- [https://inst.kufarabb.=
store/signature/images/6vyhDyKq_9ZnQYSKNfRKG.png]
----_NmP-15cbdd0cad52dac1-Part_1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv>Let's do a Free Audit, and then we can talk?</div>
<img src=3D"https://inst.kufarabb.store/signature/images/6vyhDyKq_9ZnQYSKNf=
RKG.png" alt=3D"line">
<div class=3D"gmail_quote">
   On Wed, September 4, 2024 9:42 AM, Hirsch Keshav <span dir=3D"ltr">&lt;<=
a href=3D"mailto:hirschkeshav@kufarabb.store" target=3D"_blank">hirschkesha=
v@kufarabb.store</a>&gt;</span> wrote:<br>
  <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
    <div dir=3D"ltr">
    <div style=3D"box-sizing: border-box;"><div>Hi Redkey USB LTD, been try=
ing to find your email lol. I know this is probably weird but I thought I'd=
 reach out.</div><div style=3D"box-sizing: border-box; font-family: Averta,=
 sans-serif; color: rgb(65, 65, 65); font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><br>&gt; =E2=81=A0I saw your product and I was wondering i=
f I could help you get more conversions to drive adoption, free of charge j=
ust to get my name out there? I=E2=80=99m an app product manager + UI/UX de=
signer and would love to see what I could do for your business!</div><div><=
br></div><div>&gt; Hopefully this is something you're interested in... let =
me know if you're down to chat!</div><div style=3D"box-sizing: border-box; =
font-family: Averta, sans-serif; color: rgb(65, 65, 65); font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, =
255, 255); text-decoration-thickness: initial; text-decoration-style: initi=
al; text-decoration-color: initial;"><br style=3D"box-sizing: border-box; f=
ont-family: Averta, sans-serif;"></div><div>Good day,</div><div>Hirsch</div=
><div style=3D"box-sizing: border-box; font-family: Averta, sans-serif; col=
or: rgb(65, 65, 65); font-size: 16px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: rgb(255, 255, 255); text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial;"=
><br style=3D"box-sizing: border-box; font-family: Averta, sans-serif;"></d=
iv><div>P.S: My 3-minute video would put you 3 months ahead. I promise!</di=
v><div style=3D"box-sizing: border-box; font-family: Averta, sans-serif; co=
lor: rgb(65, 65, 65); font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: rgb(255, 255, 255); text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
"><br style=3D"box-sizing: border-box; font-family: Averta, sans-serif;"></=
div><div>Sent from my iPhone</div><div style=3D"box-sizing: border-box; fon=
t-family: Averta, sans-serif; color: rgb(65, 65, 65); font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial;"><br style=3D"box-sizing: border-box; font=
-family: Averta, sans-serif;"></div><div><em><span style=3D"font-size: 12px=
;">Quote of the day: Opportunities don't happen. You create them.</span></e=
m></div></div>
    </div>
  </blockquote>
</div>=

----_NmP-15cbdd0cad52dac1-Part_1--
