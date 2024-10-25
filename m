Return-Path: <SRS0=zNE3=RV=mediatek.com=yr.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61205D116E0
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Oct 2024 03:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46803C4CEE4; Fri, 25 Oct 2024 03:18:45 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0F80C4CEC7
	for <linux-firmware@kernel.org>; Fri, 25 Oct 2024 03:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0F80C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d41abd46927f11efb88477ffae1fc7a5-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=G8qmEpQ66gE8tk6cXVsBlD9+MFs/Iqrcf7Wuf1YPEUg=;
	b=NKbPBAzA+ZEV0potbm3IXxO9Fq25rG8/MoZ4Q2Lw3u3lzW7CrQKWiWFvCJsOo3DwVNkddaokunoyclSS/TG3MiCS8q3clLXXCK/hOSdL2H6SoNhkjqkaafi6+hZHH+wleHXksSNHPGZR6vZyiEqZZTCT7921WCnrC0P/ez4JG2c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:7e4f6fb6-329d-4822-82f7-0a315081a763,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:21ebd5cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d41abd46927f11efb88477ffae1fc7a5-20241025
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1243742942; Fri, 25 Oct 2024 11:18:38 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 11:18:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 11:18:37 +0800
From: YR Yang <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, YR Yang
	<yr.yang@mediatek.corp-partner.google.com>
Subject: [PATCH] mediatek: Add sof-tolg for mt8195
Date: Fri, 25 Oct 2024 11:12:42 +0800
Message-ID: <20241025031848.21368-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241025031848.21368-1-yr.yang@mediatek.com>
References: <20241025031848.21368-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: YR Yang <yr.yang@mediatek.corp-partner.google.com>

Add sof-mt8195-mt6359-max98390-rt5682.tplg

Signed-off-by: YR Yang <yr.yang@mediatek.corp-partner.google.com>
---
 .../sof-mt8195-mt6359-max98390-rt5682.tplg      | Bin 0 -> 16191 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg

diff --git a/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg b/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
new file mode 100644
index 0000000000000000000000000000000000000000..427d6c62387b53f8ac898a86b506e8c0cb4362a7
GIT binary patch
literal 16191
zcmeHO&1(}u6pz+w(N^lmNqX2rz=IIFNk73u)1-xBYy&knp+qefth6*Oq_-X_2p+7W
zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~BlU>2!O{
zkq(%+D3^pi1iL88-LUjIB2=7isA<F9+InIcDJ+KPhV=y384^QShn|4uGnegwJPI0;
zFP2Knb4v>=H|MPUd~x+!@%k;x9`LNW4e`7nPG(^(QD#h!ap>%Raj$&)etP5OudVjY
zI~N!?V`aBCaQ!gs13E(<3Cn&E+R?(eo#^G2#)_&RJ!p=~I2qp!=o(_1g)KrEUl%kz
zKGvI<DqKNPDe#?{o*JLY=8{TZReV2j2TR<AkP+weU2i_T+s>z7or_;x{rLNm9RD-n
z`&`&KEc@n;0Z(%b*jIN9E~3nPQ=dW+KaP4L*L{c^l<a|dVy7d-_7pTfksr%VOpYb&
zgc4?@gVeAJThfN{6Q85dPtYv@^%<7()iJSe!hVM(MnA;ov#_kob6=o$&%^?`OU&ud
ze!JWq+!c2Rai^W4>US1ZEK!ZIH-Njzea>AwJa<z9A%CO7xgPFvJR-^6B)J<5v(iC=
zT7_+^xy$cQm%E)PGw%*%q<{m8a^B4p7nfI-W-WWjyMn6U^>CLh)qdymJE$9qyqnrD
z++~uI^X^H+hdGl>OiZGr7Wn?nyM<hz(piObJ>2E@JGn~^$Dy1roHu^IedOG^r+GI;
z?gqoGbU;5{QDN)F-OXdo%ex#0>N?cr?(lB7JM8wf+N%1Ug}WuH=;mFz2XMD<pK~`A
zp1b`5A%CO7xgPG4r;+4tAGsS0v(iC=T7_-1xr?uX%6fN%2>?RwZeW0P*Ho+{eEpWU
zbg2mQAeEdnVi0H)0&}>L{M%3U%!TvZm9@9A7?r;%T;&{nPlpj6I9vB_#{T1@dY!~*
z9X_Tk+k44Mmx}P20Cn$rR|&-w4iEzVeDt1_QRJh}+J{3*KEl^`9V!p|X?&nk3@05N
z%rQC$)bd{S45kshck^Q*r(VwxNr#X9mhH2)l+ngx<`|V?_~_tZj?qEDmybSkzY%<t
z->Du4RB-{<T8~p;8)d!(f?&O@{r=9WVU7lY)*w)BO*5tygMdMx2?*5wUVDu;n1Yyp
z_?%}1If&1F(y;t2zatvOxiJ5)kn4thza;;+!TnFk&ittN><8U2Vi0Hv0wzDU1ZLBS
zL7*uJL^VG$?%MpQ`z*F8K$@Ex1UwKh`OyOubIKqP5d@-|AGwy@nIHAujYMQ<Oqd4%
z0h1pOz#y6~{I>{1H9zwI$MQQ$J`Z-^QFfqH>=$!rv-U}b*++`^quP5R5wf;~>01z1
z#7SV)lznN$N_XELunOK3rHxLtBe2r$TM$;9cf=~pex~Y3f<J}XUlhhSxYg>b7=z%=
mEs}c>R_;3*Vx_x(M7p)Ii2iHu=LqAgY*=ytR>7MIB;P-JU)df2

literal 0
HcmV?d00001

-- 
2.46.0

