Return-Path: <SRS0=Qz6m=6X=renesas.com=kuninori.morimoto.gx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7599D637DF
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Dec 2025 02:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1096C16AAE; Wed, 17 Dec 2025 02:02:31 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CF97C4CEF1
	for <linux-firmware@kernel.org>; Wed, 17 Dec 2025 02:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3CF97C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLOck7zmo4vw6VFmfq8oa8y52tXYnLt7zJ+D/AZuGYBQiBrYxEusiC/6xsQO6H7Cttv1Gr9YyI/3lXv7q+1TSKqDTAA8f7NS9kWCfwJNFqhpEZhWIYVUcPq13QV1psKZQAKN3YHV7X0xJxOvFHC++Pw2vYU2ierCFxNAtxiNLMuzSIAsUnM1rPhwioWbc86htmpn0cIlSZkqpbQTELbkgrzQ7HrGuAGkEDdSdTRiKQv8F8rJYTg8LTBGEEh38CW2vybyL28kKgnYc2/A+63sSxUxp5fonJq0WuCrBjQjTfnx7VIwbTymh5kVQjmsFESbDffFz7MCmEXU2VoAu4oJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytopJ6+51y5VK8uV3/WXwf8aP0wg5IeT/kMt1xeye14=;
 b=cNpJNAsxP9NKOeM5Ie/90I69yP55oWEMtFOUZVf+/n5Ed1uLuBhDJVelxnjkdU9jSNcZqdT6lyI/odPy7i1nuiZsE8Pg0F1JzFXbKwfGV/QiFMy6BfzV4d36APD8VKrifD/J8Wqs9k6eRIZH35lVsSKiNQ7T27MQPkhx4lcCeF2JTpIRwn1GxY1snXTgZXrp5Jgh53lYefDphpf+GvaxghDfls5C57m2SDowofc7bqvkSW2kkFYL+DN05LFgMlUcZ7q9hlsY8frIRRf2sq0bZ79bdtWPirNL3NG+XWYmWSd99aWbbhDogXTren8KMG7osRURvqVRkEQYZIY8C/0E0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytopJ6+51y5VK8uV3/WXwf8aP0wg5IeT/kMt1xeye14=;
 b=Yhrldetu0LvFU3WlnBAp/OTN2HbLmnZZEm4gpxbX4LVUjH0GIdwzA2Mwn296VtmG+BkyXOliVgG9af1zGPGMFgANawAfRgDShcEvoxuV8xJi/bHdm8ROcoFIjG6JjtIo84gqv1L8BVyEQJl4Y/IyeNWCLBH+biub3hKlfcdwmzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12324.jpnprd01.prod.outlook.com
 (2603:1096:604:2e3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:02:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:02:23 +0000
Message-ID: <87wm2leuhd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: <linux-firmware.lore.kernel.org>
To: (Renesas)goda <yusuke.goda.sx@renesas.com>, Antonio Costa <ancosta@synopsys.com>, linux-firmware@kernel.org
Cc: (Renesas)shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] rcar_gen4_pcie: add firmware for Renesas R-Car Gen4 PCIe controller
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Dec 2025 02:02:22 +0000
X-ClientProxiedBy: TYXPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:403:a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6b68d3-0bfe-4e28-a74e-08de3d105187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7AUFIRJDx8Am5uO8nf3FIzjLNZY+VvQzESUzOpDbssTRHkAjma84wq3PJxrI?=
 =?us-ascii?Q?+/q6f/Qhw8P1hSvWvkIDOKCMBoOVyyJim1SaO/tobdJb4Itaf9CAB416c3Ai?=
 =?us-ascii?Q?bxYUEioH6rMN1jsZK2QFCR0l9Pq8NNJHofQK2TgNybpKC9d9Pg/se0IuHS/U?=
 =?us-ascii?Q?v2/+KNJcB5wq5YmzCMYUzWWg/SpbpoFS9P/Stek0pPpYlNxS9BmeQVIWIJB4?=
 =?us-ascii?Q?eEZs5+K57TRQqNar6YwNYmTZslMT8F6bXrooJgYFXpl/iymBA16iryWD6BlO?=
 =?us-ascii?Q?bmdNAZXnJdeBPV8pCrUT7jQwUC3XiQHFohfS198pOmg2UXYJjkjGPevYhtQy?=
 =?us-ascii?Q?wDvvQ+Gh312KO34/8045M4MIJRUTZmOZ283rAKGNO2dQ4dRAJdQwtuUGFDTf?=
 =?us-ascii?Q?bYDGKLoq1TboH2YTQ+0L7OcoX8o3oGU7qXdgHpbxF83cgjprRIXNyyuP3tD2?=
 =?us-ascii?Q?WqUTf0fzhjswFnfYgZt04zGJXjDDoOsUoJO3g6JL0lbu1ehGNEH99fxp2Opn?=
 =?us-ascii?Q?APixAzCjka3Qqowe0quZMTrTpZkH7b/zNp6Yyclx5MkDXH/dkkjtBZ1grd/5?=
 =?us-ascii?Q?w7v61TDu5JWCjT33oMBEv3EXmDS1m4ql3g1jIF2fxuyszatxqAZqXIP0Q68h?=
 =?us-ascii?Q?CgAxe+12JrsdFINIcZD4sL77QepYt+n+UYP9YK7TJLUBbaY32/8LhNQ7oFFe?=
 =?us-ascii?Q?Mry367JH1VcJaN626RPzFX1HztTWBux28+8K+1osauph3r7ozrgQUcjgoG0h?=
 =?us-ascii?Q?dwGWmKrBs3NZ4gm0X1kZjPljI4QOQZHPEK9bR6bdNy8nYzq+dwyMPd7SYzdF?=
 =?us-ascii?Q?tsG/jQEA6Iwr3G2yiapX+GFueKv7go0uEmvffkw5R88CnAWa1WENUAwdNxeC?=
 =?us-ascii?Q?7SQ/NvxgAB6qwQZdOIiIWBrxjYMT5xMJlE8AoG26CzOxX4/FCyvqo6HddA86?=
 =?us-ascii?Q?Hkz5PuUas5873OBXXjmT2YR7flHggHgE0MUGxDUOXzaRtOyYrQEMrEMLGHwa?=
 =?us-ascii?Q?4cd9lpj7gvm7UUgOqmt4TV/8PYzqF0Fq7pzolNUU2zR1VLW8XJ0MNv0Fkenq?=
 =?us-ascii?Q?mxEZ7izgNbnNNjNiqxVkuyDIT3sTWFid+fZLoGoFwvYs/OplmhxTjv4+aeW5?=
 =?us-ascii?Q?j9RpC36eQpZ9vShOTnfDbyoHm75FHqsSrz6h9Jm3YFQh6wNUvLP39UJ0p0dZ?=
 =?us-ascii?Q?GnwdIp9OL/HhRgHhMhkoE4VcF2cQZ31F+t17WeUDVZgiLcUnj/nvOyKKv8/F?=
 =?us-ascii?Q?kMXNb+OvINTjulRge/3oYkRuTGJkXUnPIqjgUxt7geXmp9bO/lX8p5D8wWRi?=
 =?us-ascii?Q?b66ImDGITf9mFpDw/0naxKpEyEdGrJM9eC7fUJ8OeX4f7jqYMA+x8jwYhPcK?=
 =?us-ascii?Q?YqccKxrCaLAm8NcD3QgmSUlMrb7t6Ii7BWgbumKAepd2HKoV3nB5VVtZFPpE?=
 =?us-ascii?Q?Lai9WeUlZRDvaqqYbt7XVms6MiS4oqYd8eE3RXSH76qpuURKRBYXE5XOQI0Y?=
 =?us-ascii?Q?BZJeoaLct96WB7Pbuc7Z5z+ChYGqn5ixb0Kz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nLj5w5i0Ql0gI7qbswgg8hO62cKnIx1EI5zBOdV+GE0iaPdpb9ySryCo0s4w?=
 =?us-ascii?Q?pzxs1OQM3xGteNWSGLkPVpMskqTzoZIT9QP0fwUK2Zo+5V9hLCMCMOF0B8q8?=
 =?us-ascii?Q?1RPqp3+JBxn3i+iCAi9TsJEkLw4B10OTEyUAo83VB8uwAY/uVRlHRlItvh3v?=
 =?us-ascii?Q?S5iTG9KgGl4f4AJTT1PI3xU0mhwS2ppYuCBJoYPusfB++BqlZhIOcJbbUqH7?=
 =?us-ascii?Q?KnNIqrktHO9F+p4ZWpNXESqxc/q2xxc2s01czZX/XiAttaP12mS9jhCkD2gB?=
 =?us-ascii?Q?d5Cd1EMw5ICgzugCu4qjAMGjBpSGHIJrLbxMFAo3QP7txN+dpl9bhAmwbvAO?=
 =?us-ascii?Q?6wHwh42JbtESio9Y33ILGWblEPcgykw5HTisNm7nwjMBvsK2ewpUHAsnHyei?=
 =?us-ascii?Q?wmAGvS2jUUUc1ZNuPyH79IZU/XFu4QsapZRmXXe3/hL33caF7O7/Rzv0D/Bp?=
 =?us-ascii?Q?xP9nsLgO7Sqvb4nYjXHIj0LDd2sfVXZg5108lxmPfxQUb6ciJF6GtJW4PRvy?=
 =?us-ascii?Q?CQCT4/VfnqdCNO5sNe7W5uwu8+nb0P3oPi4xOLv4UK62VxGj/dvLS/w5Y+On?=
 =?us-ascii?Q?BIwIqQBAxTQUskX9JSFF2sbby2Il6tVoRfbUXOB8V7k2wfReb89mwh0RTblu?=
 =?us-ascii?Q?d1qoeQjBdcdtVyg/fcqSQRq//yRlegILmXfUnJeswsv2vUks1vWXgS4Mtee5?=
 =?us-ascii?Q?EBpdZrAhuBAYvuDapqXvilsQS76Dje9TWyvqj+peZ1RIoZetl5IEPAnnuwbx?=
 =?us-ascii?Q?1rHyBQHLivz9ucwKbivb4pdOwyvid4ZliEYl2ZRlqGGYcEZZ1hQ9lMVTWAh2?=
 =?us-ascii?Q?7CGeUXQgr3peA/r1pzq662mIQpgkspbWkFY9AeHiruQ4XamSQA5VVYH83EmI?=
 =?us-ascii?Q?7T4rYT0X51VLOV9F8SOwhslCRrY6Ix2AkTJkBaPII/Uw7pZmsg6Q4Xd8ddjx?=
 =?us-ascii?Q?VN3uI6ErVVcHafwfQy2Mwkkx4bRBnDFX3qU4geZpkG1H6o0SPwLHDkq7swDO?=
 =?us-ascii?Q?/yfRJlD0MMK6lhOMdlHNauk9sU/G6DSOg0+T+Cj0unrNpm95FTTvvqIVSnZJ?=
 =?us-ascii?Q?As+t+8tOpuXembwQTwabK1xF6ZuzbpIGndzFswTYCLm8+J0uXGkQuuacxfb5?=
 =?us-ascii?Q?zZcdhBF45LGRdXlPOHeN5Vn3qCRkbsDdjcAOwd3AT78SQQW2zCdrAT4biDs1?=
 =?us-ascii?Q?+mY0Fx7QVHMRDaA4xp69mkzqRlaDzK78qjqRLzcAE6b/47Ph+74RrlkXfmxX?=
 =?us-ascii?Q?WoMKMTorv59sdTgwuTBV+9YbsMmZQqa/AQupeRgozNPWz+csONqF90nCiL7e?=
 =?us-ascii?Q?QaDtLmyHt/gef2MogBjtwrLU1YdfxuvgRo7lTDUW/KoKg9jcC8CEjbEut6Hn?=
 =?us-ascii?Q?Td6ohuXB+qwpsciGqAk4Vy93P50a387w0W+cFI6dL7W5j+ORPK5+6vi8rPNQ?=
 =?us-ascii?Q?x35M/NDknbmrNNNgoVFe1Rg9EQHTn3uQ7DYjEFbBHicw3URMHGlxy9L/O2W2?=
 =?us-ascii?Q?//LCN71AbndYBRIR/Q3UT/kaOuKfM52t844SdGmDnYUBtH7JP0v0MTtBPbd+?=
 =?us-ascii?Q?dR/TECI49avjXkNygzTfFsiC1z2YwYP0PwVCDoYvWgGOMjaAQrTkZlf0arrR?=
 =?us-ascii?Q?QcLjZAacFrGAh6FBk0gp+P0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6b68d3-0bfe-4e28-a74e-08de3d105187
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:02:23.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u1FXctApOmmIRkP9mDV/043EtrsvgN3LnwNipsx2AGcDpAyyzMMpkJlBz8EjYGRXHG1bvClhLeyR8DytN+nV4GgNl3mjYvc243RLWBbjVipceYkU8HU3pAGi12uGdbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12324

From: Antonio Costa <ancosta@synopsys.com>

This patch adds a firmware for the Renesas R-Car PCIe controller
for R-Car Gen4 R8A779G SoCs.

Signed-off-by: Antonio Costa <ancosta@synopsys.com>
Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 LICENCE.r8a779g_pcie_phy |  28 ++++++++++++++++++++++++++++
 WHENCE                   |   7 +++++++
 rcar_gen4_pcie.bin       | Bin 0 -> 32768 bytes
 3 files changed, 35 insertions(+)
 create mode 100755 LICENCE.r8a779g_pcie_phy
 create mode 100755 rcar_gen4_pcie.bin

diff --git a/LICENCE.r8a779g_pcie_phy b/LICENCE.r8a779g_pcie_phy
new file mode 100755
index 00000000..6a56a631
--- /dev/null
+++ b/LICENCE.r8a779g_pcie_phy
@@ -0,0 +1,28 @@
+Copyright (c) 2025, Synopsys, Inc.
+Copyright (c) 2025, Renesas Electronics Corporation
+All rights reserved.
+
+Redistribution and use in binary form, without modification, are permitted
+provided that the following conditions are met:
+
+1. Redistribution in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+2. The names of Synopsys, Inc. and Renesas Electronics Corporation may not be
+   used to endorse or promote products derived from this software without
+   specific prior written permission.
+3. Reverse engineering, decompilation, or disassembly of this software is
+   not permitted.
+
+THIS SOFTWARE IS PROVIDED "AS IS" AND SYNOPSYS, INC. AND RENESAS ELECTRONICS
+CORPORATION DISCLAIM ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+IN NO EVENT SHALL SYNOPSYS, INC. OR RENESAS ELECTRONICS CORPORATION BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
+OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/WHENCE b/WHENCE
index b0ae2cb4..375aec65 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9140,3 +9140,10 @@ Driver: sdx35 - Qualcomm SDX35 firmware image file for Foxconn vendor
 File: qcom/sdx35/foxconn/xbl_s_devprg_ns.melf
 
 License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+--------------------------------------------------------------------------
+
+Driver: pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe controller
+
+File: rcar_gen4_pcie.bin
+
+Licence: Redistributable. See LICENCE.r8a779g_pcie_phy for details.
diff --git a/rcar_gen4_pcie.bin b/rcar_gen4_pcie.bin
new file mode 100755
index 0000000000000000000000000000000000000000..ca314c69b5794e06a39343dec5bdbb79bbe8d5f4
GIT binary patch
literal 32768
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

literal 0
HcmV?d00001

-- 
2.43.0

