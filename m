Return-Path: <SRS0=fjZc=TG=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E2C433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Feb 2022 19:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6991BC340F3; Wed, 23 Feb 2022 19:53:28 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D9E3C340F0
	for <linux-firmware@kernel.org>; Wed, 23 Feb 2022 19:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D9E3C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id w3so45941116edu.8
        for <linux-firmware@kernel.org>; Wed, 23 Feb 2022 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omK5lp/Hl9aUYrg40cetPGZCoo2SEfI9aO/EhsJxbHY=;
        b=nrFJVhcxMGTh00wAXNphHXY4GVqX5YfwkEe2oL1Xp7lRsYG9zFmvPGCgkLW+QHLQxR
         a7RdAvNws+CcXcdtiWY/+C8gDWSef/Our1VBZOqPKMQIJJ2WPbhpbA7htdFjORirJn1R
         c0oH5NVVCtUmOg+3gGiwi1wdiERJrQK1PRZDd3oPVk09WzubUv8j1E92upLOAjJ9buFP
         Myn/d5yfPmG+5fKLYhyJLoYR7Ea/nQl9uZPRy0zZYe7OeuyOW819Y01DDeqHaNLHP3UA
         2l1M6r4KHCjPmTLKMvVEpc4GM8aau+BpDP2ymmFWE2qK7hIn++JEURy6Owm4Qu+wNfFC
         Ln6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omK5lp/Hl9aUYrg40cetPGZCoo2SEfI9aO/EhsJxbHY=;
        b=eDfbpbdui72XbbuYIo+J96lTOPI8nGR4a2Cpncv4VrK+RApWvZinLSVctVSnVbPCPV
         2LsA/UmVjy6LqmCZH1eaxpWFnMcCWx+BZIXP9Bj6KcnoOrHoVmZlY261nebYV7oiguIM
         IPhaWECLYTb9pBn9H03PlJmrjuh2PM0BgVkmmQWOBoAIlk+9g/ioPSZ2qV27YObDQ71d
         pElMfXIQoq2qsru7qXt/2NUJklHdMU/MrGZeM1k8kO8R5W3+gSelzv0WADErBwXgp4dm
         kI7yfej3DZdKj4vcOhONSyNjMRlgAqY7ZoTQ78piTFH4VD3eBI86P6zkKLqMDAt36hcm
         Helw==
X-Gm-Message-State: AOAM532ZOK1GYz1S26OX2RogxFUEK3yKkgvjL0UcxDaq0szzD/uIsvc+
	vkQ5aAGTRpdGINMBNzSorwFakUndFAk=
X-Google-Smtp-Source: ABdhPJwiCelisoLjizTM0xr70H4drk2jeTMPH7tc4BMPtSGmQQiKUblfwATXZpLAq7zptn1Jb6O3dA==
X-Received: by 2002:a50:9e85:0:b0:413:4f26:213 with SMTP id a5-20020a509e85000000b004134f260213mr607708edf.266.1645646005813;
        Wed, 23 Feb 2022 11:53:25 -0800 (PST)
Received: from debian64.daheim (p5b0d779b.dip0.t-ipconnect.de. [91.13.119.155])
        by smtp.gmail.com with ESMTPSA id d12sm318148edy.17.2022.02.23.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:53:24 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nMxhT-001Rgf-WF;
	Wed, 23 Feb 2022 20:53:24 +0100
From: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v2 3/5] ath10k: QCA9984 hw1.0: update board-2.bin
Date: Wed, 23 Feb 2022 20:53:21 +0100
Message-Id: <623e92dfaae9117e59c9ff9c9d1189295072d034.1645645875.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <63972ee8daa620c57eda5eb89221ecfeb55f46af.1645645875.git.chunkeey@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com> <63972ee8daa620c57eda5eb89221ecfeb55f46af.1645645875.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA9984/hw1.0>

Includes the following changes:
069b752 ath10k-firmware: QCA9984 hw1.0: Add ASUS RT-AC42U specific BDFs
c0b6196 [v2] ath10k-firmware: QCA9888 hw1.0: Add Linksys MR8300 V1.0  specific BDFs
43ebf8e ath10k-firmware: QCA9984 hw1.0: Add NEC Platforms WG2600HP3 specific  BDFs
26dfc83 ath10k-firmware: QCA9984 hw1.0: Add Buffalo WTR-M2133HP specific BDF

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2: sent to linux-wireless + ath10k mailing list too (Valo)
---
 ath10k/QCA9984/hw1.0/board-2.bin | Bin 171916 -> 232684 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA9984/hw1.0/board-2.bin b/ath10k/QCA9984/hw1.0/board-2.bin
index 6530e163c7c21652524afec0b0cf3ce45fc82704..82dde6372d8804ce974b62a6a1e9f9efb9eae9a7 100644
GIT binary patch
delta 5491
zcmeHKZ%kWN6o2<YY5BiG%UF4o*HTK`wWahm1WgxV8`=#aWn+Ryfy#ozLD%t5W`M`C
zO>rSx>y3M8)S>&bn8hG(u9z6KA58e7>HJKV=?CS5EX_iQCS-WuqopNKC}GeT_e<V=
z=bd}*J?EZ#&$;J~{*dz5#~H(y!CidxrpKR{>?*-{RCpBX<7N6jM_0SU*>mV{Z(EzA
z<D8+P{)C~%TuM<kJ3w+Ik|s-}^8jR7Ug>vdjUb-%A!=GMthXVB6Txr{OQ$@(JdZmQ
zV4m@6@IB*t8K~gwd^rHj`Fv24G_{OjSMPbg(ZlKMDRB7Fg#?*Q1_Lb?k6+{s)PUbb
z0AuRfal?%U&_ox;7uuNBdwde_v<58UiK8El-+_)L!ut!2(?aMUTxLzVEduY<bHFZ$
z_ky13k9kLTMKIp}7x1fMeS=GYdDsO6Li{u~I)3+OmV7Twl-v_c2uD#uD6_04gxabj
z278C2r|n!<XSbo@C3Bg{WV2J@r0~f<0AL9;$_pd#{Ix3RoPUeWzkWZ3-X8=JA82A#
z>-F6O%{g@bIuOJ<R(|X}c@PA#LJ)*Zwh51xZzZ@BV>TMQ))-oj4A|7d-8JydbtZ=V
z!5J2l3%8PE6n_Azcj6|P!&(2gQ^GYz{xB8$k$?NejqX7yt7y&yU<!%@rNR5{0DGk+
z{l66n;so}%vo`x#IQ&1tfelQK;9hha<cb)H3oofPhvT55-FdeALbsu_tDG{K41Fd;
zTWf1)IP=@igu<Zu5?>Bh@a5n;s1QWhhblq}8k+OOt*sbeAYv3nEj)gVRWrYR1steI
zTt?t!QM2FUQ)Faf!z4yl9!<pT0=s}A2Y^I(AT=byy<ZUEJOBU*Az;`9S6BY(@hQP1
z`~v9Vl@>en7n4*@P7cOBA#CxTjsWZGX4rt^Pa#tv!NvO}!o|OzJdvUa%C$v>N~N*@
z!}8OFaJgN|ye`3qXiFGolTokJs4SKsp+sG~&C|xL1Qn^U_N*lTOIPo^^yLq(!Bt|6
z+ZYZk1@EURVU@MrskMfn-Iz3m`mHAI%4pO^k=3or>LP~eR)^`J_|Pnz_*BKr4&hlU
zwO+5kqg`qBX0v&+B$Bg2!$5|O8Tt;?!=|MQ_Nuc<c*{QsZq4-xa`A*jL6T6EoRXTB
zo{_mvoRuw+=H$xqJ{%xDK8;{vq`$F(aijpL920Q|lhl~XD{S`0mNTyY;Su-P`0a_Q
zA7^G};Phwp9)B+DuIUG?e{cXKEiNuDEG)2}KbQpEzVmyl4(+#EN$w$!*2PJ2P%n*+
z`rfX1?Shg2<LQ1K9bfkw6FK)Yj`x8S9nHCwdOj7^^NnM-e*!20djnnIYfya<#TZIj
zN>v2-uq#C&sX@?1fRECsBcMWi17=PQ(orRzV#g-t9gDJ}?Q3T*>f8YO^){Q9QU`%@
zSOi^SMX88~)f&l<Mk61&VZczPD(0rs8@Zv@6?%P(gl+KA8wX+MtT(wM`1kcZ`ui#h
zU%{0pPn|TJs5ev|v6xSFM%=v@Ut?S@oM1K0qV*+bwu0vNR-;iDk_7isDM?b!QQXH~
z@aWi-AX|8|A`N^hJUU{<JD8BOOHQcKOF<UM2^sIdSa`2;j*dle+j6Y)(&@x%l`#sU
vb`%?px(&yy#&uMQz3Dg>#lG!p5687!8(MOaaVPX@Toc@U%FWwgTtE01AI#*U

delta 13
UcmaDeldoq#S3?Wq7N(y004sO}&j0`b

-- 
2.35.1

