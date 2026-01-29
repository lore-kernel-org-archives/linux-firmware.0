Return-Path: <SRS0=mPaz=AC=opensource.cirrus.com=prvs=3489a8a77f=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8840FD61033
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Jan 2026 17:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EFE9C116D0; Thu, 29 Jan 2026 17:12:15 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1154CC4CEF7
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 17:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1154CC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TF4AVu3709926
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 11:12:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=/X3zZPfmQDr6es12GydH85Nf0Yb88AljN64jQq5xgDQ=; b=
	S1E+YebdpykOonvjlo+btlvK24+naFjbsMUoYW1DasB+/gVoj1VfKaTHtv0y8A2A
	kPTibFsREbMGFc/1osXhrJ11TCdsWRlGmlg21ygkxOiqd1xCn7uPGoKIOzAd/jCq
	c2jBf+Zvc0sgqFbU8kTS59E509G7mgHkY/SmYMQs883bUWuxNMW8AF4pGGC8Z75C
	6qpM0ZRVdpolTC9iCAOBVlCodXppD2jJfP6XwMkqoBduLcE4D+DPXcGngaAeTn1J
	8j5DiZKyugrEdc16ohMe38whUuX8uQ45vTPFmpXUqsMmodhJHtEr7nFcrpMIwMhI
	0hnai9xrM+f4eHzHPyU+OA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022103.outbound.protection.outlook.com [40.107.200.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c09us85wr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 11:12:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgqpjcdDqynBNGsMauiV2Q0W1XWFOnYulmhvufO3gUTcd2fDpzYzGI4pMgqoReqOFl/WN9ppOJ133Sd+QcKZF17cJNfV5lMgEwIy6GoikG7E7VLy/Q2YNRXkqcg859hTHboHD+BuojlRDu3CJGbMPdH3x78TTTOFDEEuyyVd+8RfrW547bRJ6gmF6hzGKX6x04sj5BmoUTZNzApWvT4TqGwsdACO6A5ZaY5udAA1yi+Cz9C6T0/wGOHjIUigBseRQIXy7xoMfAfGOpSbkwrK2IUQGPmUzC3O/HGIwJg+cpeY4GQENxQpYHKPaDEB6CdCVT5MXTUKM7S76kxCgTHgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X3zZPfmQDr6es12GydH85Nf0Yb88AljN64jQq5xgDQ=;
 b=ylLyaDWhy/B1/WTH+G+Lwtm6hLuAL5f7wrfzQLrm+YgoaPgguofahLBibzezIHvZj5H1qV9P1IvMO/sQPZqj3HKZiUmxl6BDpcjzMumBpvcmMUhVCDUZpP1TApr2gZxhkQhK4Z17yCf8pJaJ7ZbNWDt6qY6pSe6GWZadhATwR2Xx30JfiqmoKJPza/eJ8Wm5Gm8bR5TbTtDPVLGt0ghvXXJeNJ9GaOm/0cUuCnjnq69A3fLhUbVazVdbBu5C4zW1vpK0TxBCG/5C6hR6eFIdnD1OZkL+GoDSEfsVSgV5I6qn9gZ1+8ZYe+Vw6Yu1HQ5ocfEov6dQnwRVBfiRkEcnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X3zZPfmQDr6es12GydH85Nf0Yb88AljN64jQq5xgDQ=;
 b=YJOsvEqYvmaApHQQgxynzu7n+znmJ3xYaQ/KLZz3tCZCg9C3qRErK6iF12ixjJZQ20bB3i/4SCVoXsDRlq2EzNbE7VNnNYM260lasyM9xVjgiOnrJts4qrUmFfPpEG0iJkfUcbddLo5eX7nOVZ4Np0JqIR/vRofb3oEUXtTQPk0=
Received: from BYAPR06CA0054.namprd06.prod.outlook.com (2603:10b6:a03:14b::31)
 by BY3PR19MB5138.namprd19.prod.outlook.com (2603:10b6:a03:36d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 17:12:09 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::16) by BYAPR06CA0054.outlook.office365.com
 (2603:10b6:a03:14b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 17:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 17:12:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 364E1406542;
	Thu, 29 Jan 2026 17:12:06 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15EEE820259;
	Thu, 29 Jan 2026 17:12:06 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1] cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware
Date: Thu, 29 Jan 2026 17:12:05 -0000
Message-ID: <000001dc9142$64f4dbf0$2ede93d0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01DC9142.64F52A10"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdyRQjmeAbSFpxBDTNCA8oTPMJMXrw==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|BY3PR19MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: c95cd946-8fa8-426e-b4da-08de5f59891f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|13003099007|8096899003|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aWEXbl87abz/pn4ClZ4dWnPJdbzWvuEb8ryesf+HgY/t6oZ0qVHGe3XVhiJW?=
 =?us-ascii?Q?Q/J9O+3LRPpmqUoyq8JmZNFJIzpTR+SLRLl5qWd0Amei175CBj4SL/DBdcBx?=
 =?us-ascii?Q?1vTOMmpAXBkJaa5Fl25AXxmFbxgBjT88tVXWxWd5X+2Q9zhVLbDZ/fCXQDmU?=
 =?us-ascii?Q?Ii/0GzUEbYnl6h5z878XhCTmfymLBQEjq4ES9LYUPoLxS1tnsdgWKymetdyR?=
 =?us-ascii?Q?03LcyM9Vl3ItsM073fp9TG48lA+dgopIM3PIwnVJZh+AXZTflq1ClSu6pNm3?=
 =?us-ascii?Q?Q2pNOX0AoSLZ2wFtyM4WZEMQT7FrEPKJ5UMMLF27wT4xMF8UVApiRkinVwke?=
 =?us-ascii?Q?11LL975YuG018Bf3ldh5hbJKChHJb6TM+RMWkOiyZFw2tnqhsrgsXnWpsiLo?=
 =?us-ascii?Q?iwDY/YS7icqD9yIiKjz/uB1506G3LFIGXHts1eQc9nPfK3QRbUPVr2LJMBL5?=
 =?us-ascii?Q?tkyeWCxzwp6iAGBBUKd4LjnQlOGYLFNJ7uuP0wzi35rZ/XrIxPEMpUqQfmVX?=
 =?us-ascii?Q?uRmGkfFNJ5axFT2GWGPdQLEGU5mkmr1f4oyctxBGGWCBmBuWc/p3e2yMoD8u?=
 =?us-ascii?Q?F7JTqEuXrHzz+k+AJVWsllSSTHdApk3JVmEB8kYMrfBwTCrnwo5MUzBk/GJS?=
 =?us-ascii?Q?pw5E4R6qexHEot1D/gu5yLIvVCddKtWbpw4gKUsqh2dbxF0dxA2Q/+d2SLPL?=
 =?us-ascii?Q?0TBrXPkxRWF+FsjmGatFPsGpRWf7Z6V1FbHUINMhsS3ycGYc4EcbC00pmWLW?=
 =?us-ascii?Q?DtidQek1XeUFyDYoF5XQ8XsvRrR6jxGOC6fzBzkHeHYbhFGs2gbZ63lggr0W?=
 =?us-ascii?Q?qz8LOBnM+d5gRizhJs/iacgBbL5vEbUKQbEz0dfhM24FeyvypEpc2cIiqPGt?=
 =?us-ascii?Q?dWuff+ghaB9bQMRbkQwCQxJrinNN/P4SprgQMExdODMN0hWP/oDs/osomT98?=
 =?us-ascii?Q?lXJspqi6ddIdoFguPIC5qWaYJVIAtSMRQmdNNK2q6dbLsLcx+4Vm8gRggADI?=
 =?us-ascii?Q?yiObZKm5qPsKYxSdo3DL8M6cBeQg54y66m+Mgn3xMIc2bbe5JFOATkw8qOvW?=
 =?us-ascii?Q?5he75Ibs2o3rE/aVv6Q4Fh1VzOFE+0zQs87CXlx6N/cYFWrbUAm7yb3oXPMa?=
 =?us-ascii?Q?1lhWr+pwKHn5wzdwc1LMQPQqTgcuOHAfHi8JFhXkAujsza1REANFEDMfb2mi?=
 =?us-ascii?Q?MhwU0uKxHDkAjqzjUseiXH9+l0D8avZNyKt/4ft5HqoogKorXAhHsxZyNSpG?=
 =?us-ascii?Q?ob2JcjmB5G/PrdEK8ujIvuNjVPbnQ0hew9J0b3kSfQBAiCbZwIAXbuWiBwAq?=
 =?us-ascii?Q?4G4lcn6lMWac/uzGYKspGKivygvs4TufDk+PeLTGtXI/PHyla2j5N/P+4yxy?=
 =?us-ascii?Q?I+8PQtIsyp4vSXGsAtG2Pcc/xVB18pPLUr44GesE5pM1Z4vfQiGAKYVu4fcn?=
 =?us-ascii?Q?0VhbqNY1L+70HlLYM7Tak1gPQe7vn+Tp/jGnE2y7zDCU7V27Gz2ZM3WHMHOo?=
 =?us-ascii?Q?yvDODcSdqalU0M7jSEGXKIBrYJHFgyQ8vgLDxU2p8hEXbSrbJ4dG3cKRKsOM?=
 =?us-ascii?Q?L1+P9kJnRy557c6V6LSi6/gM0kiugT/8YOIfUH+nBmSM75rwXtnBc0WPlp0J?=
 =?us-ascii?Q?HkPga3o6rt8GfVjsTU+HraWT28cGFYnGmhCs6F3MGf4wSDdMx+4fBQXqUGoM?=
 =?us-ascii?Q?DrUwdg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(13003099007)(8096899003)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/uGqxtDqXLFy0OFgDGdPu/Oaw2l/KFZ1W50ZKMbzPk0rys9pSQbb+ufXxkS32dDeA2eU2edKD78yUPdT/5f/VU+8LGeFC7Sui6DdkYCqVcFBRMq/Jnmy8BnCgcrQfQb0Cc8JDCALUvpQGvfM9qPCVQQ2yE1aw/KrnRl/iMy+UFBWo9wxTV+kDul2mulrk25I00s5ovviJa9CFavv9tVqhG8hmXR+eDLAyyasySv7dsA+6coNa17BTqlSaeE7lBKmgPYLSkMP1IwRbGjtKJExsIpeQndTJp9nLPybaw9f5vIqguf/9G0fmnizB76ciB3FMarjxoUCEvssdnWKO4pDTr1OsteuMKIg0av6sEhMAAX6mFkk7CttH6YRMU0mGUYEmk1RvEUGDvpOUiThHHIfPwh+tkBf8vhjbWmYe0fr0TzB92DVTrBhh2dFiGmc35oM
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:12:08.7127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c95cd946-8fa8-426e-b4da-08de5f59891f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5138
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=697b94ec cx=c_pps
 a=K7AEBdpZSLD1v8U6HgG+qg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=SqNHR1Cw3pd1jiIfEioA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=F9EA1suADr4w6XICzG0A:9 a=eGHeHwhxT-xyF78a:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyMSBTYWx0ZWRfXxj2ljumT0hDr
 ORGgNFl0gJLWtMIQkY8aWf+QlJ/+B6Tx8NKbPrY2xZ1k9QzfNcXuy3eBN6cl3sj68bHen8CMBVG
 /BsYIZufj1SU7SqoY6faUyfO7L4YxzqfNawTnyoBHQ3GhH+HV1dxj+yEUhceqXHn6wkSpq7zcu0
 X71LldejEphw0fFcEgrd7/p97s9B9kKIjcfUMuw65Jd5pUTrNrVjKZAlFPtL050JdkCKy09QzOs
 RQ3d21CPG8l41PLu2r2UU4TGpNSrz0vCgEh25yXASV0z5LbIZUepkDejvYzv1kI74N0YZldBvS/
 hf1zBW46ZoH/WSLjOZ3KteQELkfoOTwck+ZZLGmaJVYyNk4saOily2deOwwAqXzqK81OoNB/R8l
 nJiPqWck2LmlfrTTO9t/uS043q7tCn+p9DzwPWoPaY14tJJ1tZVeogdWbMiGbj88ksjNRV68nnQ
 U5tuCkVHzmS79tFpxUg==
X-Proofpoint-ORIG-GUID: sKpezmyGRsSLoFdDur25pj75EeZx-wP5
X-Proofpoint-GUID: sKpezmyGRsSLoFdDur25pj75EeZx-wP5
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0001_01DC9142.64F52A10
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

One little patch today - we'd like to add some Links: to address an issue
discovered on a Lenovo laptop running Kernel v6.18

Thanks,

-Simon

 

 

The following changes since commit 2e5a8b0550ba3255bccc2bac57c520259968f5e9:

 

  Merge branch 'main' into 'main' (2026-01-28 02:12:22 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260129-cs35l56

 

for you to fetch changes up to db024df1e153c8fd5d3c7f79ce5ad08f09c10f64:

 

  cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware (2026-01-29
17:05:41 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware

 

WHENCE | 3 +++

1 file changed, 3 insertions(+)


------=_NextPart_000_0001_01DC9142.64F52A10
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3D"#467886" vlink=3D"#96607D" =
style=3D'word-wrap:break-word'><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>One =
little patch today &#8211; we&#8217;d like to add some Links: to address =
an issue discovered on a Lenovo laptop running Kernel =
v6.18<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
2e5a8b0550ba3255bccc2bac57c520259968f5e9:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'main' into 'main' (2026-01-28 02:12:22 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260129-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
db024df1e153c8fd5d3c7f79ce5ad08f09c10f64:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware =
(2026-01-29 17:05:41 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add WHENCE links for 17aa233c spkid0 =
firmware<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> WHENCE =
| 3 +++<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 1 file changed, 3 =
insertions(+)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0001_01DC9142.64F52A10--
