Return-Path: <SRS0=86R6=VA=nvidia.com=petrm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC624C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Apr 2022 07:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7735C385AB; Fri, 22 Apr 2022 07:55:05 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9F0AC385A0
	for <linux-firmware@kernel.org>; Fri, 22 Apr 2022 07:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9F0AC385A0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icRmVazDrFsBHfWyCUWrflxyf7D2cK8p/LPAIHd+pFPFCtq4APopBl0pwY+x+N4Y8Ydn8xmAOu6jGyco1PFFPH5yUIa0HW4ePdrYI0rpqEwY12gaD8QtWgiqx1+8YOiwfNX6B+MU22/GsEn8AqGeLMRVEc3iUefNAdFfo48I/8/jSjvpL/mpTuQn45TqM76YVzLmTsrA3aFSzDSgNPwCfWPPyEYO4P6pTiGjDHhh/hRV51M8MggDpjXY7eNHFKtbpUYnD5SacXr/QMWG/RKDp4nEMKl1JkLvlR7d02R9S/HFa7GgZxa0bsw+0a2UNEPY3poZlduVepo5EfYdD02T5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzJVVx1huI3Dw24EHUAH20GBY2N99qtaxbjIortDGMY=;
 b=FQGu/BrecLdbwXO4Yufc138VfC8PSLFekzD/GtKWciuFnbMAm5pSoUv6nkWkRuNydrh8BoKJoyJ+TQ7QJ3IYEXEXrXcek9GyvTF6bwo0yCwi9TN2svEIWga55Vwg2EA0MRxREBwF5VbLq5fW+u19k9kGHqkVNBskMKDYTujjRdMKneBCAlzEY2mHsbI8/Jzk4cfTwyy/uQXhNsEGH8TwEo5hOvGpCuU8Agn1WbefQv8hRXTvPeHWWUXRLIEW4v1oHXprXc7wv5CFE67RugpBk8PF4jhLfW9CDE16XHg/TNAj91WnqiGEth6S7jW8VUFOZtGE6HyC0vuHeayZ4U8Heg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzJVVx1huI3Dw24EHUAH20GBY2N99qtaxbjIortDGMY=;
 b=YYezcYVsbIA0gnKy8zqvttAUJXvehdZ67kqc3YnRuQENUwvpLSeoyAT+JY8mI9RFHtub74yievTaFoMrwAmBD44Ga9z6ZujUS10Um8G4s+v9dP+rW2v779RYN+Zy88kxHARMjhKJEvxT+wZGSDXEj4QSTkvfR/WmuGtxaxwNZGJwBaA0hsGMyUrIclsrB42ZaRjotIj4Vs1yGS6x7mlDTYwagS3MwBt9fdjKN9z0vB9GsXaVglDsZMfn/K1CVogkbP66OoTirySWf4i4hMYvMXKZXQ+dXcRz3tXLcT4VPgUZiaO7s7RcLkM7bcOIyLd8WrAL0uvHgsBS0u5RUyjzaw==
Received: from BN8PR16CA0004.namprd16.prod.outlook.com (2603:10b6:408:4c::17)
 by MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 07:55:02 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::6a) by BN8PR16CA0004.outlook.office365.com
 (2603:10b6:408:4c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Fri, 22 Apr 2022 07:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 07:55:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Fri, 22 Apr
 2022 07:54:59 +0000
Received: from localhost.localdomain (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 00:54:53 -0700
From: Petr Machata <petrm@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: [PATCH linux-firmware 2/2] Mellanox: Add lc_ini_bundle for xx.2010.1006
Date: Fri, 22 Apr 2022 09:54:25 +0200
Message-ID: <c9fdaa79abf51174351f2d8c0e489dc0e7c863da.1650613831.git.petrm@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1650613831.git.petrm@nvidia.com>
References: <cover.1650613831.git.petrm@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 283a0f29-d814-46de-4afe-08da243567e7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR12MB19331C1AC2CBAF2CE6F85ABBD6F79@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gzHAP2wbJvL8i/A3P6tTnixU3EuEyQi1EacZqfEHCXTbZxJgVMQa3++BInE6sEqGdTloU0s+C1VFYbOvd9ca2Chz/wEYQuMqTWjZYN5kGLPSRATMlq8l6cBrfOZ5E1fJ5vLnXh3ydz5ONJOVQQJ5Z5j/Au+jhjK/uzMbGbrVco2pGG+TTH4Uj1sCw00iNXy9LSAJhnRwx1F+zRm4ukiVyWYL52OfS2TD9iQRpweMgqh6JKH6i40p72Ubmwu49lKz6iJHhgf52ZfAJNDZB9X2jnXaPA80GuUTYfR9yWzFbp+Ss247677t6K7GuqmRFD2adOoei6AUIcvP7V2s4BZF+zwsIvuRTOl7ajoX1ShUtUvYH4C27LpYrHlfJMpvI2xp1+sipw+PkRpyUMPh4EolXnWhyt239+Nv3YZylAp/efFS5CdbkZUMANNfaBTdG0cjBWLh36GCk02CHCquoohlafGMoNwY0lrjmWmFmVG7YKh/1yzVdpwejtW9DeLb9DNT5WZ7PqeSosvP2TWFD5XZLiAKJj4ftJbWeNNHv9UDaWN6ZrBvs1/+kWMwJ99cneKC0JvHxdN6eH3XgrqzVTpuAILr+fZMcgfxu/gDTrS2iNIgNO9GyJl0OzD0jUaCNx4ir80m/K8GtSH7zyMv8ghnQf3DuVb7y+Mfp3QiCapt/FcWboPycd5V0nC7dGySUe/EKJ3Shtkc8EYWSDrTeslHVw==
X-Forefront-Antispam-Report:
	CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(54906003)(86362001)(82310400005)(508600001)(8936002)(5660300002)(6666004)(36756003)(81166007)(356005)(36860700001)(40460700003)(316002)(2906002)(70586007)(6916009)(70206006)(4326008)(8676002)(186003)(16526019)(2616005)(107886003)(426003)(26005)(47076005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:55:01.9549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283a0f29-d814-46de-4afe-08da243567e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933

As of this writing, the FW version xx.2010.1006 is the lowest version with
which mlxsw will operate. It is therefore useful to distribute the
lc_ini_bundle for modular systems for this version as well. Add the file.

Signed-off-by: Petr Machata <petrm@nvidia.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 WHENCE                               |   1 +
 mellanox/lc_ini_bundle_2010_1006.bin | Bin 0 -> 12300 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 mellanox/lc_ini_bundle_2010_1006.bin

diff --git a/WHENCE b/WHENCE
index 93c1716..56f3cea 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5883,6 +5883,7 @@ File: mellanox/mlxsw_spectrum3-30.2008.3326.mfa2
 File: mellanox/mlxsw_spectrum-13.2010.1006.mfa2
 File: mellanox/mlxsw_spectrum2-29.2010.1006.mfa2
 File: mellanox/mlxsw_spectrum3-30.2010.1006.mfa2
+File: mellanox/lc_ini_bundle_2010_1006.bin
 File: mellanox/mlxsw_spectrum-13.2010.1232.mfa2
 File: mellanox/mlxsw_spectrum2-29.2010.1232.mfa2
 File: mellanox/mlxsw_spectrum3-30.2010.1232.mfa2
diff --git a/mellanox/lc_ini_bundle_2010_1006.bin b/mellanox/lc_ini_bundle_2010_1006.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c042838f7b5884b83f59d11a36a672240dc8e8e9
GIT binary patch
literal 12300
zcmeHMTTc@~6h6D#`*kUoE~P+uB)*gvpE1UmCW=Ie@eLnL4FAB#p@|Vtv}r;@h!|h_
z72+fR!dHGpJ!j}`cDHk+w5G8$o5`6uXZGvYuhZG~oUK>S9@n;N55S86fQ^0Q{lg7-
zTCL*nZq1FfIyYFhMNnWT><n2a<>bgl+=xpyT8I|N#=KaWY`hd-Av>BDZ6zQfp^|n|
z@<=68l1Dm~mOL_UM)JrOvXV#6%Sj&jQhtOyVl7v=f{4u2XX<1NhlS5%XOCyUkezGH
zHOS64=bK~~&KACrEuI&@lO0Wqw>;qq!dk2^N*<-dlH{>;yd-&)8)eC3xw$NPtemY#
z9;@f8BjbUaqq{#w^S*{dF+5b=CPfc`btD#7$@R|!euYIAJAQ>lzCUt1=HgJpbvk@J
zGei=53VS*PpNYdhgO4Yyh+>an58)x0I2<wf7#0?GJo1DS!k>x5C4d#etAoVp%f;cE
z!DsXpOdM_)d`4eZ|D>hYhtXFsaagy&9;f~_2A|QF)qkJCzpwsB3_hbTtN*11&N%hI
zX7KN;{|$p5jey+aakO{_`5V9gZM{ASC@jPt_WaRk@8>$y+~DhFGx`{P^a|*sX8#y{
z^a}h<)bhY{Jlk8t#rSJ>VB3a@E<EtQUf^wSh@%pA2P*C-sABeD6Oyovo;UCl-nsZh
zb3cNMd@Al0RAuf!x%oesoPhq~-r@!5uLBtG^#OX<DUMI^0@*p{CT<j%ZUto0Z@MLz
z>UUpUOT7jUpK|yF1lW1;{L#*n-8~%c-bI#4$s`&c>ZfM(FnXv8sIy7g9{?33rui2s
z=m&rMN58;fSQF^%U#G0u#F+-4PCr2>AZ4)VH1xG@W~;r%7p8v;T71g>19i%TV)r-c
zYiCL2y1)W-==fu-TU`jt@R5)1A5ejS9}IpH<CLXrXDV@~H1gyBCRs(Hb%Az;9u0r0
zx={56sE1WxI+YoU(HejIjSd|?R*!%R!Bj;e>ub{2iPPFZ!_B9|r{XeIrUq50DBfNZ
zR>9I?2dE6=&~P6HE^v>*4@jaoj6RASfr-&4Ac^8I`Y3V)CPtrtB#Oi6qsS4M7<~eg
zD2{RKbNgbZ0-%Wg&nEi({|U=OpZ~uYbN>IJFaJ;3e^UWqKQObvD9~2GQ~;)XE4=*m
Gb?*-Yk`GY;

literal 0
HcmV?d00001

-- 
2.31.1

