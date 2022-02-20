Return-Path: <SRS0=FTFS=TD=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2BC433F5
	for <linux-firmware@archiver.kernel.org>; Sun, 20 Feb 2022 00:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADA7FC340F1; Sun, 20 Feb 2022 00:03:59 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19B6BC340EF
	for <linux-firmware@kernel.org>; Sun, 20 Feb 2022 00:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19B6BC340EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id vz16so23827414ejb.0
        for <linux-firmware@kernel.org>; Sat, 19 Feb 2022 16:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zaog4ZVVU7kj3gXse8f+25Qq7QAIZMchHDMnlMpleuk=;
        b=eUo1VN43QTewZ0WLX+e6yBJ6Xe7Uu0ggF23bJqlCQbpeEHnKLxmUb3fiTuA8z3xhv9
         ZzQTWtqbWeT7MPfevb+Wle3X+rhnUbOjaRiDLCI4NONhFNuFKQUSBCYUpaQv+et+3FRa
         EG1zdtK08dMQ3j9s+tYY30oaTWBFyuPLHsr0LL3Dui6Bsmx1iT3bIO9Z4Er2SapzgAYL
         ZQXu7+pL1yqfiITdzTOxdWUT7kbxPgZXt9sG6waDPpjFkte2lTwVIc7EOZD5e9+EBrYb
         K+58HYHnojKMeJJd12Usc2bBjcS3jizD7p38ZS4B4x865d3iIjr03rFBNldDDC3E/+0i
         ipCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zaog4ZVVU7kj3gXse8f+25Qq7QAIZMchHDMnlMpleuk=;
        b=nyRCH22bMKQeYzBSvybejULsfjZ0SGkq1jAw3IrQ/YylovW1k9BrLA2MxgS210QeCf
         9xOKlt2darAuoNQsNWAcIKmFNP7ySqcO+E9BZGqJ8+iTNNIb7dfJPIyne+JJ6h9M25vN
         LjsgtTiLmsw6SbVX5zdEUmcmoblaHwilAP/E08Slt1pnyFDkhtYJvb8ekA0yFL1lWu70
         hIeJRb9K4pYdE+DhwNCGOSfX8ZZHGxxR2dSGiiMBmgd+x7CEfpZzVmBZR116uWhIbcz8
         MrRkP/yH4A3MsBZZkwG7qOdv6aKG3YI1wSgT2+Hmt5so1V3bcEbu3o1Ygoef1Eaza5ec
         utBQ==
X-Gm-Message-State: AOAM530Lv46F49gqB0Xwx7OIrMhp4ggT4Esvzt8EtV21FJ4RlIPSA/kc
	op0eWlm9jl90Z6v1GuUS2RwFpwtTzME=
X-Google-Smtp-Source: ABdhPJwdV5T7oiUsaA2VGcOpK8TbSP+5LM15Sof9Vb4iLuSAN0Yp7CrfBpWJF0Otwm5+vCoRBIK/AA==
X-Received: by 2002:a17:907:8a04:b0:6b4:e098:741a with SMTP id sc4-20020a1709078a0400b006b4e098741amr11173275ejc.550.1645315437284;
        Sat, 19 Feb 2022 16:03:57 -0800 (PST)
Received: from debian64.daheim (pd9e29b3d.dip0.t-ipconnect.de. [217.226.155.61])
        by smtp.gmail.com with ESMTPSA id o17sm2525329edr.47.2022.02.19.16.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 16:03:56 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nLZhi-004177-Mv;
	Sun, 20 Feb 2022 01:03:54 +0100
From: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v1 2/5] ath10k: QCA9888 hw2.0: update board-2.bin
Date: Sun, 20 Feb 2022 01:03:51 +0100
Message-Id: <d09e1f4b89f3f516f7edaa235c5034a88d2f7c76.1645315230.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <542cdfe3a91a19cba63c98cb742e63d4b58240d9.1645315229.git.chunkeey@gmail.com>
References: <542cdfe3a91a19cba63c98cb742e63d4b58240d9.1645315229.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA9888/hw2.0>

Includes the following changes:
085c231 ath10k-firmware: QCA9888 hw2.0: Add Plasma Cloud PA2200 specific BDFs
4965bc7 ath10k-firmware: QCA9888 hw2.0: Add EnGenius EMR5000 specific BDFs
7ac0eb3 ath10k-firmware: QCA9888 hw2.0: Add EnGenius EAP2200 specific BDFs
75d699b ath10k-firmware: QCA9888 hw2.0: Update OpenMesh A62 specific BDFs

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 84928 -> 121384 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA9888/hw2.0/board-2.bin b/ath10k/QCA9888/hw2.0/board-2.bin
index 3038e97b4809cf976644ecd8833d69e865ac0b29..007c82f5ba5b82726e842d0329ffa379711e8014 100644
GIT binary patch
delta 4376
zcmX>wopr?)_J%Et&9aP~(_3U2%NZFaZ(uCko-4-~tUGZ63ul2o0~pv%Pn2Oalyl8<
zPtD6LE!K5)3@|b>Fv!hi1WGFa6)EV?bJ@N`hB2IR@_NQ1kO6x+C*R|~z_@7hdY%_d
z+aGH)&gJE1X6NMQ<rfqd6_=dMXfHZBURGiH0ZT>&mIWOJ0h4FQ%1pCj+%)-=oZ03%
zavm)8N=ga}a&j^<Qc?rLsvjteq4w4fpx;4Gs2|wim#H71c!xzhD>&(GPV|#u+J45F
zaUP?Uf{Kco0ub1s12ruz9W@|87q^j;lT(lag2{@SF;+lY0t7Hr0gaRc0SpNd5fLE}
znEXz&uO4K(l9CdpDk@5VJffkYp@QKODLD%{1sNF`Ovi(~h*tvW_nW}D#Nl@;O5h1b
z3rIL(cncQ5I3=d@doo5k$f&8wz?2}fm2`A;VB%s53Szj}z#s^4K#qE3Hge2^oCz}o
zojv)DuAP*O3`kl@2}Fv4?Sqk%FUsjDKoS=uC5ecD6d{u~Hq-BUG0IGSCwB^W(e4{$
zYJgg_JJ_Qa?VIm$?_?&SP;c2BQ1OLnvyS2p#(Fh16%_?wijk5U5EiIZ9}tV7_SO%e
z-$72Or$g}LtF8ySR2K!8>Iw{kj9Zv<xMYCz9RF%bU@6Z7E#+AjEm^W?a-p0k%ZgR2
zR)85`5k<`et65M0%2+610TiGJf;h9JAX-2rILiW<$ygamV7r#VEXAs35wIk=TaVKj
zRFuH&qgfUZYcTx^wH~JgxG=Sww+x{GnZ0BUc5!4i^OgYvAZVH!BMV&Z93X&k76Ac_
zJq-wOu|Y+tJVX~nJ%o)y0%JpyeHK_~!Sq@$M)B!=UW{zhA9*nfO)l`e053otAZ_D-
zoW$bXMCY9R(iGhQM^Ni{v~5hg2JC3tcwqWOz#0TxxR17tZ4h9zZ43*GVbL}|1^{vw
BR%-wN

delta 28
kcmZ3nh5f*E)`l&N&9c*f`!H58a!%gBShzh`jxksl0H~@8ZU6uP

-- 
2.35.1

