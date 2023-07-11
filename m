Return-Path: <SRS0=Pvv3=C5=nxp.com=neeraj.sanjaykale@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF1C001DD
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Jul 2023 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13187C433CA; Tue, 11 Jul 2023 12:48:40 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AA0CC433C8
	for <linux-firmware@kernel.org>; Tue, 11 Jul 2023 12:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AA0CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n99M6J187r6tFepfSxaVKCF5TAE6u7vuLBpXhjJTBSGEx+1KZW41YQ4ojKMhFyoheAI6/cvwh5nQhbFM1jbIJLAGND0UhusSzGfTDY7EhzQiMgKhJQeRR6dl/xGmbTMfOdEzoDc5Q0N4braya6bROj0fCFKH6j7MOACQlNvZcU4rIrw9ao68HU0368pD/iw3VoXbDRUcidkIiRgB+Yf+5pftmdeWQUo8AziDOXEfhE+WZpfw5sGHCqtJ3rOXntyXnq0ru0Ee+t5/WHDhcF0zHeAvmdbWv24e8dhyA4oJk3Z7fR5T6/TtlJbx+nof48Bf3X5Al0XyqfLYk5oxgJehrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12fMIstOrIuNCvsXYSgF5yco2AjOTELoTiNp4KxBjbU=;
 b=SnReLm4ij5Ons23GOzukQvHUc2r3qwoEVwJ3aYhREW+5fgAWwkopWnhj8mr7LjVpjdONPD6U9u349/BZkLFHkdJsI4r2dzQQgzU3G4Oh0ndsJ0oMnCthNYDXhNkn7KQXmmNTOTWGQHf2wDvQJD6ZdmDypsZeRL2J0/xcoEMVydohWtTjwsef05NA8E2iMNiW+CJ1KZlJs6JBsqqTbCvl9gSXALbE2/id0JHwCm5TIKd3PA2TaZsXJbclfBsamMcRDLsYN0GmhCzkjmB4MOhOorP9g+l0wbCcyQl/NSE5j97NMsrs2q1u4JppNqQzWMn1l70pXRwS5nn8RVZbrMYdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12fMIstOrIuNCvsXYSgF5yco2AjOTELoTiNp4KxBjbU=;
 b=PCZnHLqfUa3rOR6E3/2macE7sJWNqr5snELzaSiCMIHsg/4DfpiC2cggozmLidVMmfna8v8wtSfN0tZ9tWPAj1ZBeP8XbdtXsG53zSgyortd5weDze00HfpRgM6Xhxe21vUx4jbY4IuRbfnC5rcs2NP/pITYyCkwAjeSI3pj3MU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 by VI1PR04MB6959.eurprd04.prod.outlook.com (2603:10a6:803:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 12:48:33 +0000
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::d437:4f6b:a48e:8bc]) by AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::d437:4f6b:a48e:8bc%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 12:48:33 +0000
From: Neeraj Kale <neeraj.sanjaykale@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: amitkumar.karwar@nxp.com,
	rohit.fule@nxp.com,
	sherry.sun@nxp.com,
	neeraj.sanjaykale@nxp.com,
	kundan.kumar@nxp.com,
	ashish.patel_2@nxp.com
Subject: [PATCH v1] linux-firmware: Add URL for latest FW binaries for NXP BT chipsets
Date: Tue, 11 Jul 2023 18:17:54 +0530
Message-Id: <20230711124754.1739-1-neeraj.sanjaykale@nxp.com>
X-Mailer: git-send-email 2.33.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To AM9PR04MB8603.eurprd04.prod.outlook.com
 (2603:10a6:20b:43a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8603:EE_|VI1PR04MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2b067e-4b04-447e-26c6-08db820d2276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nkc3+2qRG6anLUoL6dGnpNAVi7r3rtTnOCgbNh71GeAV6QEVMxd/C8FOLN6uQzWx37uUAhxx0xTDWkbY+dQApmLHTNnZ46Erjo/i+gUKUjk5gP6FjZq7l8cxQhsllOwsYOb1u4beBXN6Egg9mW+YCq/9IQYLTj6GnaCU5CuiNQn+FaF3QuxdIeilC6HrPGCO9Hs1OnsJQrSEbghWGhCRAJQBPY1K80whLfl/ycnExLXopOpUYR8EfEY8IU8NMI6gEIQht56pCqYD+6+hMm1PpXnd1ApRBcMeLop8my2fpgd/hdiLPyty4oo539tb6/knn78ETFe3agrGPxcJBdatUaxWSLhoNeVsdqEeZlpv4e/i8BhzAyVj/t0qPqIFnjnjClncpvfXYNSCCow8iPZq2J6NAgmQ8Vexs8OF7Gxgjq0xSOvSfwHMOhWe5fnL3xRCTKejoLqDwR41zeC/zLnKUmpvmn60Bbg4IksmdnWJ5bDFZXZDwu/Heas5VUF1d/9DcuuDPwxYMJ+yHxLaNl5c5qSs2pygaehvG1ox7tFEDPYFj/9yS2R7l1+wVB4m7O7clztZf++1rScpXRDNykCwiVm3UKzS6hzLrbbFCUjHGow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8603.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(186003)(2616005)(6512007)(26005)(478600001)(1076003)(6506007)(4744005)(41300700001)(4326008)(66556008)(5660300002)(2906002)(316002)(8936002)(8676002)(6916009)(66946007)(66476007)(6486002)(52116002)(6666004)(36756003)(38100700002)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vTGW9/qsjBPnvG3aE3VP8DejJSQUk9BjKzOxl19Kv+R0/WbNpDMTdUOQl+rM?=
 =?us-ascii?Q?GQPFpRsJ9/vtTiXXf2xaTxcET0Aza3417Xg7IKuqdDZ/BXUL36CeD3SeGcIt?=
 =?us-ascii?Q?UYEj8b9Q9SIvQiWiA2ZJRUPK9dwnMMuRozkMXrs1axF0/fTycI5rL2A4w946?=
 =?us-ascii?Q?XYlotNXIfuRGmUd7HvWc8Rbbj3V+GwKNQExWiJ5J7vrVMiq3D2BngSX9bfbH?=
 =?us-ascii?Q?IUbwaFovWwL9oGgVv4P8+Pz2IiOHoYlHoZpa5vtD81M7xBcV9uovNYAsn4sQ?=
 =?us-ascii?Q?dKWM1Zj45jaiRkoQR36IekqPCr2HazuPzIybmvBp0WAvwSTwtINN9DU+nv0l?=
 =?us-ascii?Q?4lltHT9VkBiZNL9DVY8NuXcMIuNzz64evanAryGKHUe6MZmOGhqBIZBPNg9I?=
 =?us-ascii?Q?Z2e3vrKDRENAr5T4pAhJSOQenCVQM0M7OjE/TB2Q67ZhhThVCr7/dCr6Gy50?=
 =?us-ascii?Q?pabWarid3S+Y9qTdMD3FUlIKZ6qx6j9AqgXQ7IuVSlaV2r4E+B7SbY4W4rsK?=
 =?us-ascii?Q?e3FwCRcfXqmMGfkf5tt7NdUw9/QA+23tdTlbQTLNABlzZywIQ1ceeXYthN9P?=
 =?us-ascii?Q?4fUvLsP4dpAeXZvpuRvAZ8r/O6jdHyTNYjwAZZ7L1mswDYHl9DBIPiX09Tm0?=
 =?us-ascii?Q?u0AJ+2aGdi2OHnEGuGjQJPmjeAmkqD0BBNVAjRsehRmdI8UkhNZrURfppVzU?=
 =?us-ascii?Q?ubRiAE167RemMdOQAt0EcRMR8Ed+3sRDOYhLrJ7FHgVaTrUCi5DcCq7MtwK6?=
 =?us-ascii?Q?/OjkN5vSVYblQh5Hw6Y8Oztcxmd2A9l1NgBgFKAkzEUWzZUtiEY27JuuxvKj?=
 =?us-ascii?Q?cK33JTvEvosY7EihKoHrvkqdwjKLmDjnHXl730w3FlSg/wypncm+9E6wH82u?=
 =?us-ascii?Q?C5FWzYkMocfKpOZ3NlaE9TopQvJb/m2f/j2bDLKx3vGjhDe5NCcfwif4tXI9?=
 =?us-ascii?Q?eXGzpPThvYPUTACMiP3Cq2zEB+Ub5xXc9F2W1MFuycPiZPxY6RFcp23Cm/mp?=
 =?us-ascii?Q?XpfpXf2eZzzM+zH7A+G+FzxEtRUnp3ZExwcIu2hsPoc6ScaCQOR03WqV0Uar?=
 =?us-ascii?Q?rpXSEyxf3AuXSOsKyEI5Fw9TM+b0XAbzLTg29tzWofmvaeb7nP4gNkGxRyPN?=
 =?us-ascii?Q?7RuzMFf9GCaDQohuDU4kktjbvIBPg+tru7ObXq5HJ5I7YchbLmDjC34taFos?=
 =?us-ascii?Q?83mbcyX4bhmRpZ9i7jKRHTbrnbagbIPKkf2wzj9aPQUuGQ+xLT1dwLHp+lS/?=
 =?us-ascii?Q?qKVAotIIJm3C1EJpCuGps1v5w+le9y3lvmxlSGqbh/apmtac3PosTPyLxEYL?=
 =?us-ascii?Q?uOeg/sWSqRuwOZ8PEG3Z0BRLeSdOSoyHjwJxEb/LLWSbEY+khGC+bPfEPLFX?=
 =?us-ascii?Q?t2DCmn3WN/EuVIvVYk9/g3FYy/UEeR4cnzRlXep1zXxaYmMEpCLhxDN8q2gj?=
 =?us-ascii?Q?YX1UyccviudANMBhi0YwPjB7IwiGbPojXwjzyHqMRE9tqNXhLpJlmvNodXUk?=
 =?us-ascii?Q?nPXUr+HylaChWNGvCzezQEexPaM3j974sGd5929WL5Jmob9kYmOz+7t4ghxe?=
 =?us-ascii?Q?8Iz5hqg59uTNdARoWPiSPeoXFTtlKrAka6ADrPXZRbCCgQi087fdbZ/yFDtV?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2b067e-4b04-447e-26c6-08db820d2276
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8603.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:48:33.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcY0P3aZ5h4Yip526ZMDGQrWmunLD6GZms/8jZ+KEBCz6po8mzGOo1Q683mbkwhzXaZViUQHXAd1j0xO1Hsva9caMSN1cUzz9bn1+93MkmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959

Adding URL to find latest FW binaries for btnxpuart driver.

Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
---
 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index e53002fb..e6d24800 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6332,6 +6332,9 @@ Version: 18.99.1.p154.40
 
 Licence: Redistributable. See LICENSE.nxp for details
 
+Latest binary files supplied as a part of BSP from:
+https://www.nxp.com/design/software/embedded-software/i-mx-software/embedded-linux-for-i-mx-applications-processors:IMXLINUX
+
 --------------------------------------------------------------------------
 
 Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
-- 
2.33.0.windows.2

