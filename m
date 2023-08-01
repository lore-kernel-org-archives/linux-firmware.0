Return-Path: <SRS0=BoFF=DS=nxp.com=neeraj.sanjaykale@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5219C0015E
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Aug 2023 14:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4996C433CA; Tue,  1 Aug 2023 14:05:48 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2057.outbound.protection.outlook.com [40.107.241.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF153C433C7
	for <linux-firmware@kernel.org>; Tue,  1 Aug 2023 14:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF153C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+L+/b/uLu3hwmVZYpvyTSMH2y4h+b73jUjawZ41Mdl0QM4QE1XR5S6kiphJ4zLcsNj2EgormJwPLK7JQQCMxyF5wAWtjahfkztTYdjLMXK2SOaP7NqJpqbImjWfnpwIJktJQiLjH/+2p/0PYHUwshvu3tsRAQWNZoqJCnWJF9fAUKR7Q9JDMDthIsACvG4UG/P4nE31sFoKd+djkWNG36SCiKmCoWeAzgQKEB0qJqYT4Z9eSuDgvNRQQsBNf34EHW5rbGuFcbpJOzfGNrhHqOsennkMQoEDdTalqA2oI3zR/q6dmO/J8u8QYoihksSmj6OvlCTIm8E3+Qv3NZyQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26lxhvU3l9iTHQnM3Yp1C7xqlFO5hZcxylS2CL43lSw=;
 b=WEFIf1f4S1QKWZVo+5Kp0MAQ+Yz47oCbkrxgHBTiFuTFPoS9AcKFl3uzfoHx5WezfuZ+GCqDS+BbPIQ9ZXXLIixjkhJlmT50SowbQtpp7EI/kuyQAlscaj9/aHDdudDZ1dX5c6eEHanKq9snDsHi1a0co0aAOEUCA/5RPG4GLCsCVCvvv1vzmHrfbuVAVeNPIOkuDyoeN6wzUnCUZUVuFFa+AMC/nNMUmXWycCiwTCsjO6E5LNqmTrLRcXiJQE8XH1fHjrsQuB9v4HsATJa+QLz4K3PB2HMpHM1Wx5BXpIX/hgLY+tXXvEnwDZ43TX7WZyn8l0H02wKmaYH7X4vzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26lxhvU3l9iTHQnM3Yp1C7xqlFO5hZcxylS2CL43lSw=;
 b=p1mydPHV82ujRv7UJTJvjv1gstroTuMgEXkvadGT/t8tacJsxxq8ZuecL38ntjq8Ojz793ifoVklFojsgzuEtKG3jeDhklnTwQzWURC0tKens5EV5cQDh7ev6XsbQY2h/UqH1oYq0WRMM89h4/ynkqJVnHf+qVsDyodNT0vLiK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 by PA4PR04MB7935.eurprd04.prod.outlook.com (2603:10a6:102:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 14:05:43 +0000
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::7504:9897:4e5d:df25]) by AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::7504:9897:4e5d:df25%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 14:05:43 +0000
From: Neeraj Kale <neeraj.sanjaykale@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: amitkumar.karwar@nxp.com,
	rohit.fule@nxp.com,
	sherry.sun@nxp.com,
	neeraj.sanjaykale@nxp.com,
	kundan.kumar@nxp.com,
	ashish.patel_2@nxp.com
Subject: [PATCH v2] linux-firmware: Add URL for latest FW binaries for NXP BT chipsets
Date: Tue,  1 Aug 2023 19:35:03 +0530
Message-Id: <20230801140504.1855-1-neeraj.sanjaykale@nxp.com>
X-Mailer: git-send-email 2.33.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To AM9PR04MB8603.eurprd04.prod.outlook.com
 (2603:10a6:20b:43a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8603:EE_|PA4PR04MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae437ec-d0b2-4d0d-4ff3-08db92986520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w5ETIrOIo0LnD9VHxMRLsOpU+oEBMxEiW83f7KMBsr0qUTDt2fTUf/oUo5XuA2mUIAJSn9Ax5PcI8rZNBeNW5bwlPfQL8eqQfGE1z+Qb4QdfbVCcuDiEUdUR9S0aqAlslhLMc2pNEOqe7abBs09aLhHa4MM66ESs56VI9zxjIa0AUyXp4DdXbIMmuR4FFenb2f/EEGdv3toh/PN8n64n2cmEp5CRPfS3c2Krfi0ctgzs6oKUK92GRwMJufpIY2u7wXKnt4jlh66zw9HQJENfXUyEGSE3C4sufCmGD6HOWiMTSWbwGSIs7C0l4wy9gPJi3HsTh9XuOlrU0dh5YgfUBaNP4ZZIqn9shFORbZG5VS1py6qZbis4XKuC8G96c26uRG4YuYautF+XUvWAkCdGTm0YM/0kcGyMAe7joADPRGhtbsIz4CLsXM6pp/dze2s1dh9q+0lwPSRzRxUWw1faXM3g8tQOqnnwTM3y7JFwjVrrEpjYBJd+8i5bP6OAiV5vEMkVokaZC47syorffhBN9L08hT5rFNLfl5JqzgylpmouESGxoZysuSed7jArIJF/1kYEkBeH5R69/zGN/b43qBIJ9IuwxJ+20pnCGcTItxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8603.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(2616005)(5660300002)(6506007)(8936002)(55236004)(1076003)(316002)(26005)(186003)(8676002)(478600001)(66946007)(6916009)(66476007)(66556008)(4326008)(6666004)(86362001)(966005)(6512007)(41300700001)(6486002)(52116002)(38350700002)(4744005)(36756003)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0/MMJcWVbUvr8icj92K6cCwSxcMgDdrb+357ult+UUPuolNGiSoXyxVAvva?=
 =?us-ascii?Q?sdzK0g1AXGkd66HDvtQPCX9pMm3E2q0XqempKmsU4aulE5KaaKSoTSjgl7XC?=
 =?us-ascii?Q?DI3xiT8K92t8We1dayZJcmY3CNpJwcuRHryoZ3Gh4bAyr09jzvYNIDisPMSh?=
 =?us-ascii?Q?1MRsonx5cdMtgktKi8YE6feDQ4p9waYNYy9V6iV220+2+cFvtTEZ0aUuEj1X?=
 =?us-ascii?Q?MkUSF2NYta/UmUBI6HMbHsE8dRl+nCepcG/NpKerR1fVOd7qqZjcCWOmRLTz?=
 =?us-ascii?Q?JPo4ZeAYObrDvMhwttIzJ8QEC9GSl1RmSkEDu7HKjwhIJQrPIN7JG0436xqQ?=
 =?us-ascii?Q?c0xxWFNbBsp2/YElLbPMP/Ysh/OfwJInSomcyRaWC2QjAEA9tliITWMVzixy?=
 =?us-ascii?Q?ybP0yyYxWd33p342BzTdlZr7wgqelgSXQtyeGY+0Zil/Sn+AabP303bzwSvI?=
 =?us-ascii?Q?CCkQLrxE/gan4lw8MM7flv3X3JhyJLi0tc0EEddyZH/Uq0tkYMjEtjQEKyPl?=
 =?us-ascii?Q?lVOpdqTE90fSI/8oXb0JA795lCAhxmnPQ+J++8aPXbowcw79RviITo35v9DG?=
 =?us-ascii?Q?oGspzfoKR3OHvRJgXvsllWvz0f+fRiKWUXS6W5GIh9BKxItms0BpZJTpcITZ?=
 =?us-ascii?Q?7Z2WQU49Qq+A0HyZOJqFmIhEaEhTwpw2eIRV0ur++poLvnIHwqMP0TH/6u6+?=
 =?us-ascii?Q?+ViDU7r5K9p9EbWZ7zFVJdlet0X26qRRLXr40fX12jTjAeH/NR2krD725cVK?=
 =?us-ascii?Q?MXNkOhaPoBl0LF1ivjdOY5ZHEBsm2GypdepHIW9E4CVYz5+XbFeUWtqUpiZQ?=
 =?us-ascii?Q?I1jR3OUTjUtDxUrQtdVp1eeeOL6opgOg8U8Ft/ocbHOG7ie6mz8lGWogQGwx?=
 =?us-ascii?Q?nFOqudZPfWxpID4YBpjEJ0TQyMmNOQhAXFdhWNeTnqWbdeSIGvRxwlF1YGRA?=
 =?us-ascii?Q?YNqFyOn01bZ8IRT2BPgRcCppqUWi8T4Ibu4VAEpmnnzcbFGF2V+brhuOiRG9?=
 =?us-ascii?Q?W86WhOOQGrWxUWB5/RoKiCT7q7lnA6dZMpMUx3w8+kQ9BFBXoMRrZVg1CXH6?=
 =?us-ascii?Q?eWhZBehiZtAAkMUbi2nA4A4f5mqGvIZAwP6h1K8fZCWm0yNbvO04BxJrPTTj?=
 =?us-ascii?Q?niDTdxNLaU6wyb4GOfYJr9tcBT+EpoXarQZFQEfI5vq6B8Gg+BQk4NggLVS8?=
 =?us-ascii?Q?ZRf322F9b3zkVm212hvkJ5WKX+eI/o7YCG3jZBPCVLS3fbS8+qUm61+JVrtp?=
 =?us-ascii?Q?iRcYlIU9aEo5cmDQptRWkq36No4HWNNQ6YeM81xVJKXyAaJd8X1+i5NZmJud?=
 =?us-ascii?Q?uAs4eXtY6o7YGFTF1+2y3CkvV8GhOjmzMP3aeB8JgPm2y92Rg9SNyHcvlG8y?=
 =?us-ascii?Q?avoa2YCKASONfVxb7QOjVzL3o/Asby78LFwJ/WrH3AVSLIerLata/fVf84OZ?=
 =?us-ascii?Q?siLaeTEdMTfMDSHFcRwmBY3xioA6q6UnA/ZEsdEq03CIqIz7li8k76v/0tE/?=
 =?us-ascii?Q?pOnJIOukPEZi6hfpPZBMuRqrMQ2V8KN+gagP+Dhb9FHXiOh0DJkEXPkqpv1e?=
 =?us-ascii?Q?DAIyryvZIJHjTCm+96cskc0WremTz9eMK9Tu6Thi11JPyUhSBWBU882wb9S1?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae437ec-d0b2-4d0d-4ff3-08db92986520
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8603.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 14:05:43.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTaFFNf480N0Zxrx+uA8ye1/ZMpu/HF5dUXzLZt/XnduFHL8qQLA5SADupsmvJBwcr3lvaVGk5ma8oLKktF3KWinz9QfaMemoCyNYkhBg/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7935

Adding URL to find latest FW binaries for btnxpuart driver.

Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
---
 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/WHENCE b/WHENCE
index e53002fb..bea94f74 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6332,6 +6332,8 @@ Version: 18.99.1.p154.40
 
 Licence: Redistributable. See LICENSE.nxp for details
 
+Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2.0.0/nxp
+
 --------------------------------------------------------------------------
 
 Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
-- 
2.33.0.windows.2

