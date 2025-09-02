Return-Path: <SRS0=nuxE=3N=opensource.cirrus.com=prvs=8340570454=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCEDCA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 12:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EF75C4CEF4; Tue,  2 Sep 2025 12:36:51 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC586C4CEED;
	Tue,  2 Sep 2025 12:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC586C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5822KGc11987260;
	Tue, 2 Sep 2025 07:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pmxHUPPs1UvrcoQKCKtosFDXiKKDPGIOvQ92A1BaD7A=; b=
	L8uJSnk3Gx7B8yEfC9CDnv5kRYImVUXpcpByefuKe+jJzDha1YPCWPSSV10e6KmQ
	rYmkCbigvD0tPGHn/I3KjmiffgMYGLW/TrFsiBnh52f/YF7JWKwax4vf4XwBuUp1
	gsNNSrGvj2cAVXSiPi6UjGmPUdl0c6FyDyiAcwL2ZQdaKQt7+qJ9NYA6RrBcuRLt
	1b3Ybe47zTgkza6xF5sdORM8R6rJUsQRRKAs9hSXyYeB2z4LD3p+SYHpclesnnfZ
	sDdyJnAgo1sVyQKiOX6FkS/CKJuwX8KKT6eC9oy+xW3lpG+6/9z8RFsVS7rcj15L
	r5Y/SXjzgKNqedLfB745rA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2111.outbound.protection.outlook.com [40.107.237.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensafgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 07:36:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFL5rbNheD8ot67vWLIKkaXNEgBiZ+BRlS4KhxrKP9dELhrZ5nG2ZMkXWM4xV6f4VuQs8g4nRmz/JrLl6lKpwxUcmGVT3Ncl6R1CaRDpH6VgQRm50F3tWRAiQYGt/+DrEE5iFcT2YpNN5a5qWVIn1WLSpfj6DWGgL442wOxYJ8EJ6PPU5NQ/QggiSs6iDRQcRCAbwtDq/wdfBcTxFKyWSunp6m1N54t6I+4lZKM/ufm5uWIesJ6KLQSYEpcaPAJH4P5DISHLxEpHJZochj9lO73FpAiX3tuTd9GKPsCGig5pEsC1k6vMo2fUNQZAyy+Ibh90xXMS0lpRz8RIbUTyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmxHUPPs1UvrcoQKCKtosFDXiKKDPGIOvQ92A1BaD7A=;
 b=JrpCfUFstXQA3+LrsbKDt/Xhdr3r+Wmf+TSIeLaS4SIv0ylPoLN6RerEbRfqXFw5hAA6WMmgHzRDfshaCFZuCt2oD8XyJBiTmFOrYQ5AVVfWtWJRwPBSxN2Lbs03fejP/2yxqrWkuMHGoFBMtbcSNc0e+bFVrJoDOa3+wOZyDLEcmf8PkOx15RTm1l18/DNjgwk/99el0Aq9MvpKDjzqECPDE37DhmPMDeayjfrCMcXwJXQ8oGt5R3NyGzWUKwrchlYZECVjrWktLVWjJ8mR2X33KEdmCyecxxFnDFy/Nr8mBs4uyNER7EQU89K6yImHJTAUtJTdvwyAjupS7dYeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmxHUPPs1UvrcoQKCKtosFDXiKKDPGIOvQ92A1BaD7A=;
 b=SkKaVo7Fk69E6diT4o63p6WNDj6ZWALKvnk8uTVpjXWq3J7FDmUXzwRVz5PS5XWiRf4ydMWNQw2i1Ikw1SHO9F9Attw8kAgLN0IdqIbsoZIxvXrjvG5SBZlm0pGB83nK6tlTyGBgseIZQF25+guzysvid+33a/MW1KIRhN9eZoo=
Received: from MN2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:23a::13)
 by SJ4PPFBFAA7D6ED.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 12:36:40 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::63) by MN2PR03CA0008.outlook.office365.com
 (2603:10b6:208:23a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 12:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Tue, 2 Sep 2025 12:36:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4CD39406543;
	Tue,  2 Sep 2025 12:36:37 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 21509820247;
	Tue,  2 Sep 2025 12:36:37 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
To: "'Josh Boyer'" <jwboyer@kernel.org>, "'Ziyu Zhou'" <jun@zzy040330.moe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: <linux-firmware@kernel.org>, <patches@opensource.cirrus.com>
References: <20250901145934.86404-1-jun@zzy040330.moe> <CA+5PVA6W+7Mdt_ZHFfwOS4qXAWm3oyKp6V7Aff5Tvy5fumBJKw@mail.gmail.com>
In-Reply-To: <CA+5PVA6W+7Mdt_ZHFfwOS4qXAWm3oyKp6V7Aff5Tvy5fumBJKw@mail.gmail.com>
Subject: RE: [PATCH] cs35l56: Rename firmware for Thinkbook 16P Gen6 (17AA3921) without multiple speakers
Date: Tue, 2 Sep 2025 13:36:36 +0100
Message-ID: <000901dc1c06$39619430$ac24bc90$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEJSSUsEZe6hgy7ga8Q7TYR23DLZAJw5CklthHwt3A=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|SJ4PPFBFAA7D6ED:EE_
X-MS-Office365-Filtering-Correlation-Id: e953126c-7e4d-432d-b5e4-08ddea1d5c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|34020700016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTdmeGVTQUZ4VFhyZ3RhQkNjWkZRZFRTMVlpVVIyOFdIYWVaNUhVc0hFNFFF?=
 =?utf-8?B?SUdoQmN1L2c2UXRGejlQdHQ5RjFVY0U4OVBPRUh1M1poc292VHFlM3l5Z3hT?=
 =?utf-8?B?T0FmKzBuVlhtVktPOXI2Uk45aFNaU1dZaTJWOVkzUVJDd1lJdUFTNFVyaHRz?=
 =?utf-8?B?ZlN1b3lBV2JwME9JcDFhbURKTk1Kb0xWaUZEbHNwSXY0OWJEeWwyUjdMVVlL?=
 =?utf-8?B?dmpHTGx1NllaRE13WXE1T25GT3UzdXJLeUxBZ2N6eGMwb3ViSXRzQ2pvc3Ru?=
 =?utf-8?B?QWtqZllQMXlubWxndlVtT1ZXQjN5dE5DaUZ5UkNhNHY3bDIvMG1uVEV5djhu?=
 =?utf-8?B?Tk5RZkMyQldiQi91VFNPM1p2WXZNL3Jvbzh0SkpPMTlqQTJ4eThHQllJU2VE?=
 =?utf-8?B?MXpFbThNY3Q2bHZ6ekZZRG5obUc4T3ZPSUlkaEszVHVabFowQVBBNEJyMmlK?=
 =?utf-8?B?cTErYVZxRTZKZmhMSUp6dHlYTzZ2b2JVN2hGSmNUMGxYM0FzazlMVW9lYjcy?=
 =?utf-8?B?NDVIMFI2Rm5TUEpLczB4b1owdmRvd3U0L041N3JkS1NJNXJxUWllSzhWTG5D?=
 =?utf-8?B?SzdUYnlYODNRdElmdFFMTHd3M1VhT2xqYjVmLzRBWGZmYm45NnQ1QzdjbzdO?=
 =?utf-8?B?ZFB3UURSTVNwbkZZQWF1a1RDR2Y4VWZIWllXM2E0Y0NPMU1QamFrWkZuK0pS?=
 =?utf-8?B?VTY2MlJUeUxJQVFrcGlldWUrTUlodThkdWdpUWFrbzNQZ3F0UHM1Z0t0NlRU?=
 =?utf-8?B?UWhkR3BxSE9Ga0wyUFBkblF0TEpyaSsvd2lhZTFIRVNGSHl3V1dlVmV0RTlT?=
 =?utf-8?B?MnBsUFJHUFk2elVPWE5LV01ON1M0Qk1kbjFaWEVoQUdZWDZwamtNaXgzRmlQ?=
 =?utf-8?B?bklhZi9jOW9zWDhLVStvUEl2eW03ZW1kNlg2SVFMdFlwSWlGRW1NS3RMTVBx?=
 =?utf-8?B?ZThDRTJIK1VISFF1WEFGaWVxbEdURlZnUGFnSGZFWFRQMTNHZm1xMmVQM3Zi?=
 =?utf-8?B?K283TVF5Zmtjclhuek5jMFpSZStkN1pnYnI0NkRLT1EvaXVOT1dZajJ2dCtz?=
 =?utf-8?B?S0tSTzVmSGRWbjRCR0F2NmJOZjNxa0htcTFpY21KTFhsZXBzUzFEcFFCMkVM?=
 =?utf-8?B?bm9GemM1UmUzY2pZUC80bE1JandTOG5QMzRKbDVibWpFWmVYVHJEbGZveDBq?=
 =?utf-8?B?a1dtL1BzYmRERncwbThDSFlDZkw2dFNlbnBoTW1SdWNUSnQvZ01tZVpwMHVV?=
 =?utf-8?B?dENZb2lTdUt4SXQ3R0podlR0T3ZqcGhyMFZQcTFiT3pRSXpxMHJ1Z0xOek1l?=
 =?utf-8?B?bXIyWUpmMXp4U1FZVFZZbm45dEhRSUdnTjM5U29nZzBCaGJQdld1Wk5LaUtO?=
 =?utf-8?B?UVU2TmpSbncxeXViUWpxdmxVOXJ6dGRtUEtQZjNPT2VtK1huVkFSellMNFRj?=
 =?utf-8?B?NEZWMUFJaWxGY3RBbHVMOVhOeXRKeEVCTEJwd2V5S3IyNlM3RktkUEJ2YUlt?=
 =?utf-8?B?K2pnbGMzZnlkcGYrSXpsQi8vNHF5Mkw1aVZ6bWFsR2dWN09pUXpSc2ZJazlh?=
 =?utf-8?B?d1JzMzR4ajh2NERjemdLZ0xPa3dUZGNrMG1ReUp1azhIaVhVRjN3L1N6TzZ5?=
 =?utf-8?B?Z0Y5d1JjVXd6dFVrUThiSVhzeWVFK0RYOTlBUkVhU1dDZlhjSmtPdC9QL1Jt?=
 =?utf-8?B?VGFCNExJVkc3OUdLaEUrQnJsNVBuOEhTaXJjdE0vQktCZkpZbnFaZTR1dTgz?=
 =?utf-8?B?N2NIYjlkM1JUSzhFeXpYMEozc3BabmZNdnQ5UXNId1E1Wk5CUWE3UlR1VHF1?=
 =?utf-8?B?MG01ZUV6SWlJOWZNb3JDVXc4a2tra0R2NDgzbkY0OFFFLzFKMlVPNUNlSnBL?=
 =?utf-8?B?Y3dZK3RyaVplWHdrS3VuN1U2NCt6QWt1N0FBeGlJem80WU96bk9pZVY0M25r?=
 =?utf-8?B?ZFBWeDBJMzlhckVyRFhiY1M2d0NON21LVlY1b1BEUmoyMVpDa1NaZWlQTXo4?=
 =?utf-8?B?YmVNVG9RR2ZDbGUzMmc3NXZGUGkxbEdoYndCdkVRRlI0U2JGRzRhV0ZFUk5I?=
 =?utf-8?Q?XhTg0g?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(34020700016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:36:38.1497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e953126c-7e4d-432d-b5e4-08ddea1d5c84
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFBFAA7D6ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDEyNSBTYWx0ZWRfX4DeOnwWrLBsc
 WC9sAld0I693Jo19WqkeGLw7gPq0piWFQ7RYYussE2I4mwh1fwMlOsmWCQRHTwtO2rsfaVrd+pa
 VWPyyuvDwP3/ngBGmhmDyEYLJkRDItNSV8tITEVYrKaRJgI0dUISLXJRGoCXnUTIryShQ7YLkdq
 FWVZcY0K+vsRb3j50OSXNYo0P3cCQulfbb73e6fpIVFYEeC9NxtJrpvyeTy0MqGBv7Ht49Lm1Ox
 As7hwBo8lix49L/bf9M7/BX/Er4lpqqi9lipfEoldCZMuov8uKz1mfAijt2Eo/J6MMA8vra4PKr
 R+/IMwSSnfeiAU37OZvB+gQoCFjsBCrtVU9wt+h3zdiBVgK0Fj3thC0ShMKrSs=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68b6e4e0 cx=c_pps
 a=K57nmjWjm4f0a2EZjUQdmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=BW6T43VOIeJyKQZ751AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: GL0LKH794Iggn6YFjuXPwn5aorY_-z-G
X-Proofpoint-ORIG-GUID: GL0LKH794Iggn6YFjuXPwn5aorY_-z-G
X-Proofpoint-Spam-Reason: safe

Hi Josh and Ziyu
Oh dear - the ACPI source fragment that I have reviewed for this laptop =
does have a spk-id-gpios package.

As there may be more than one configuration of the BIOS we should =
probably add the non-spkid differentiated file as a symlink to the =
vendor differentiated file that way it would work on either version of =
the BIOS.
-Simon

> -----Original Message-----
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: Tuesday, September 2, 2025 12:48 PM
> To: Ziyu Zhou <jun@zzy040330.moe>; Simon Trimmer
> <simont@opensource.cirrus.com>
> Cc: linux-firmware@kernel.org
> Subject: Re: [PATCH] cs35l56: Rename firmware for Thinkbook 16P Gen6
> (17AA3921) without multiple speakers
>=20
> Simon,
>=20
> Any thoughts on this one?
>=20
> josh
>=20
> On Mon, Sep 1, 2025 at 10:59=E2=80=AFAM Ziyu Zhou <jun@zzy040330.moe> =
wrote:
> >
> > Remove the 'spkid1' suffix from
> > cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp*.bin and its corresponding
> > wmfw symlink, since Thinkbook 16P Gen6 (Subsystem ID 17AA3921) does
> > not have multiple speakers. The suffix prevents the kernel from
> > finding the correct firmware, which leads to very low speaker volume
> > and the error message: ".bin file required but not found".
> >
> > Signed-off-by: Ziyu Zhou <jun@zzy040330.moe>
> > ---
> >  WHENCE                                              |   6 +++---
> >  ...1.bin =3D> cs35l56-b0-dsp1-misc-17aa3921-amp1.bin} | Bin
> >  ...2.bin =3D> cs35l56-b0-dsp1-misc-17aa3921-amp2.bin} | Bin
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin =3D>
> cs35l56-b0-dsp1-misc-17aa3921-amp1.bin} (100%)
> >  rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin =3D>
> cs35l56-b0-dsp1-misc-17aa3921-amp2.bin} (100%)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 2161ec89..7cd782b3 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -8295,9 +8295,9 @@ File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-
> amp2.bin
> >  Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw ->
> cs35l56/CS35L56_Rev3.11.21.wmfw
> >  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
> >  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
> > -Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw ->
> cs35l56/CS35L56_Rev3.11.21.wmfw
> > -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
> > -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
> > +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw ->
> cs35l56/CS35L56_Rev3.11.21.wmfw
> > +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> > +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
> >  Link: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw ->
> cs35l56/CS35L56_Rev3.11.21.wmfw
> >  File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin
> >  File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin
> > diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
> b/cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> > similarity index 100%
> > rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
> > rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> > diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
> b/cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
> > similarity index 100%
> > rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
> > rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
> > --
> > 2.51.0

