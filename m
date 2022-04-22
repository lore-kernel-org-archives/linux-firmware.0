Return-Path: <SRS0=86R6=VA=nvidia.com=petrm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3199C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Apr 2022 07:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B1B4C385AA; Fri, 22 Apr 2022 07:55:04 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34FAAC385A4
	for <linux-firmware@kernel.org>; Fri, 22 Apr 2022 07:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34FAAC385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcZb3c7O3FhUAvePSBZqeON84oRgWRhDYxhhaDSHVKMa2LHEKSc+CNtWplyIH2jHTFBwjQCW+S04vdukSVXPnoUNffZUPLOAXuupegCJ4DnhSJGUg5V6Sv+bJxwcBnxEUvTr9mm0gpjmU5Iqtn7e8tvbmM/B+6UWc+7O6hT43sUbwtR/Qw3IW/OTAY531VvK6EfvWBUdp2fzpFD6sofnRdHDgna9j1PcrKAsTd48SA+0vVbunLpWg2srAIm0ompiAiWUHaMadz/HoyygBOU9f5J1NG8k0enm/tcFfREl+GJaqPdvYz0JD4h2L5a6EzJSoIdGP/EohWXkDnJj3Qzfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj6t1AwCVcLXOK0Xw71dImI0fL6gjfk8PlIuseKJk0M=;
 b=ZEReLXQO6GfJynAoenhc1DaMqjfFIx23r8qGUWtwCC6pz/VOrBo3dOWFpL3ai/SaX96jJoX+xmkOgWZcYf5NyBhMJ0ayBFU4OpEWo0ifAAGxojJUUPeT6Y7BvOXym9cizS6HZb/KSJ4XjQm8b+6Zx2MTxOBDfzh6fsvfkbTXBeBtxMtdsZ0Q4MrjyfktB0wMvxBeknCBVlSaRL5wfW+av+i1LBr+X/7mfl4QLSkrBx8tkyYGb57Yowg7bZk5Qqw3kN5G77wWNyB41/sJY9VGDmfYl19lVCa9APRAzTgdhUk5cG9UhKDvqp0OrouL7zlrJONnnaKxM/krhJrysR9HMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj6t1AwCVcLXOK0Xw71dImI0fL6gjfk8PlIuseKJk0M=;
 b=DNr0NXDUaS7KYRlK1ZrOQ7N7pepgGplz/9HYtwxUUrLzi2rec7xy+Yexja9pX/7zxMEdUJA2XeHL7FUZHkB/0ybX9aU25LP51WkcCwsX7I/r6CDvFqVY5w1ODAiVEGDmdPi0TdiH6I9NQFdSR75HiA/nzxZxFWbcyLqD8t9c6faagrxXNT38UpPWhEpQI+M46ZUyjNbmlvbAMhmKiOygU/HpUJYq9RyNivaGShKeyAk/s/6z6W/hVx4CEjpqX2f0swGu/9UJ2RfvJT1C5dQz9Nu/BxVc4+U4T7JOYPd41fX2yL74cqymnxZjHnkKKBojyRx2mqK8AzwUXfDpyOj86g==
Received: from BN8PR16CA0029.namprd16.prod.outlook.com (2603:10b6:408:4c::42)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Fri, 22 Apr 2022 07:55:01 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::24) by BN8PR16CA0029.outlook.office365.com
 (2603:10b6:408:4c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Fri, 22 Apr 2022 07:55:01 +0000
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
 2022 07:54:53 +0000
Received: from localhost.localdomain (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 00:54:51 -0700
From: Petr Machata <petrm@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: [PATCH linux-firmware 1/2] Mellanox: xx.2010.1502: Distribute non-xz-compressed lc_ini_bundle
Date: Fri, 22 Apr 2022 09:54:24 +0200
Message-ID: <085839170f29fc545cc765e63574cbd49f04c1c4.1650613831.git.petrm@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4111e613-440b-4e78-6724-08da2435675f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5795:EE_
X-Microsoft-Antispam-PRVS:
	<DM4PR12MB57952C9930FE257773EF2D2ED6F79@DM4PR12MB5795.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9eYzojjBXZUBtjVcMJzoD6NzBL3kX0vLtBZcg6ReoL12Fd6xuQiMIYx7f2DiWErzUTzP/jEiGVAdc7oquHnzCP/sN3DYi6Rbj35ftIgQiiC6QN4I5EXoiwsLUkh1eWZ8UI2aDi2B5M9P8YfaHJSmN5VgBkQH36oNBq7CVjV7qIdF8bDq8GG80T+17KCC25iqFt0BsqQM8v89Kd3ptLUht6eR7SPIXsmGqSUQCO+g42IXCijPQUchX26ZtwBWDTMqHDz2HafcMUx3+6sCCkVhu4ic16dEx4Hxg0fgelpdC8pvBGsNbooVOUGXYUlp0YmI9wQqWh5j77iSbdjuJrhE8h/pSvKdWSlePo6O3HID4eUXMx0uvzLv6XQx713hKeFlq9yBFUqifw3Z+MgOZi51MrMo19U+UFLBjmlt0Xlqhs0RiOa23tI6strRLegPSHvdiallWyw96mhk5y8Fuxu/mLbbYXq08JUyc3e6EFRJuSr66Gyvxeo5iS1rA3VFOoGAqH1rVYFxJOm5c04gYrjvaSoX/l7ET8EsUV9yZVIzgLvl0tJ0vL7vEycefEFgwUympByIE9tT3zenrFbLUP8HtRyrYDjUox285+8oJH6mSo7aj2INsupGwqBovzHYINSbquv1j2z6xgiNXbuTHeAcqVDsyu+fwq6HO24whFb4sKuC4lLmWfLHXGewf+sKuKU/kpcfL5+NUo5EkKm3M9achg==
X-Forefront-Antispam-Report:
	CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(336012)(107886003)(356005)(6666004)(186003)(36860700001)(5660300002)(83380400001)(40460700003)(2616005)(8936002)(508600001)(426003)(86362001)(82310400005)(36756003)(26005)(70586007)(81166007)(70206006)(316002)(2906002)(8676002)(16526019)(54906003)(6916009)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:55:01.0800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4111e613-440b-4e78-6724-08da2435675f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795

In the previous patch, lc_ini_bundle_2010_1502.bin.xz was contributed.
Pushing an xz-encoded file was a mistake, the format required by the driver
is decompressed, and whether the firmware file is stored on-disk compressed
or plain is a user policy decision.

Therefore drop the xz file, and add the decompressed equivalent instead.

Signed-off-by: Petr Machata <petrm@nvidia.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 WHENCE                                  |   2 +-
 mellanox/lc_ini_bundle_2010_1502.bin    | Bin 0 -> 12300 bytes
 mellanox/lc_ini_bundle_2010_1502.bin.xz | Bin 632 -> 0 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 mellanox/lc_ini_bundle_2010_1502.bin
 delete mode 100644 mellanox/lc_ini_bundle_2010_1502.bin.xz

diff --git a/WHENCE b/WHENCE
index 03208f3..93c1716 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5892,7 +5892,7 @@ File: mellanox/mlxsw_spectrum3-30.2010.1406.mfa2
 File: mellanox/mlxsw_spectrum-13.2010.1502.mfa2
 File: mellanox/mlxsw_spectrum2-29.2010.1502.mfa2
 File: mellanox/mlxsw_spectrum3-30.2010.1502.mfa2
-File: mellanox/lc_ini_bundle_2010_1502.bin.xz
+File: mellanox/lc_ini_bundle_2010_1502.bin
 
 Licence:
  Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
diff --git a/mellanox/lc_ini_bundle_2010_1502.bin b/mellanox/lc_ini_bundle_2010_1502.bin
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

diff --git a/mellanox/lc_ini_bundle_2010_1502.bin.xz b/mellanox/lc_ini_bundle_2010_1502.bin.xz
deleted file mode 100644
index c500f481d69cba3caba9f5065b856eec3938ece3..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 632
zcmV-;0*C$mH+ooF0004LBHlIv03iVu0001VFXf})Fbe`aT>vK)g_>?AIC7xc*N_g+
ztkQCn35CJ2B!)r5Id#M~@X-i~&f?aU0@YFQN19f$Z{A_5P08VC0*zAgBfFLw+!V(4
zx74;d)lyCQS@R22@##YmrvAr}+ef`-i>Wabc!2gEP^wv6041a(PzO{=N|bJNXC>;q
zNNi`^-Dt2a>z;ss@e$EK*r>(B_`>M8(XydR@F!AR#>oqqA&^Ro2ck>7%k`AT2QGCO
zLu`;$-{c61p|ybsJ`<+gj9%7EYlryDFiC+;4G>iF=l@&6D@W2!^nRiiW^&A?<Y2D*
zvHix<E96LIgp04;BG>PU6nU&h7}3Y3(vK`a=V>fN_<O{1>P{JS>YX}v(@a)Et9u#-
zqpTSrzuy;F&j2e>&xvaumIvV)T1(k7BbHo4?Pq8iVyczdwW7E!lQlLxUs-_4aeJWP
zOila^2bjq-*DOwiuesbR^2%VfK{FXUyFsvzO&frb!eMC37bWD8SrIUvneNnEc@H>;
zBvnQd6W7wQ8K*1?qUZVgmY-9Qui&*bWkX!a$Gvt?7|Ga^!)Q9wLQ#;l$p-516C=ON
zkc*!vqW*H6iC474eqZVZZ`>g?^l0~<$QOn#z2!H`1p&Pv^x1GqL)rGVYoPNLX`#FW
z7F`jSmY1>Pyo0)a%QD>z&q$@Cyn55UaT?j<;Q{xH>jqNdjL4p_f9NgVc#HpnC-Qd$
zfx`z?C|c-53bX}{P{g*$$=_Ixv$(@<Vt|fHQpeUGb(2==eE<M_;M|@70n`MHU;qGz
S?jle=Fb#_W000000a;qHcQow)

-- 
2.31.1

