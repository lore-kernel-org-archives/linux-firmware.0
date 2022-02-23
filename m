Return-Path: <SRS0=fjZc=TG=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD04C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Feb 2022 19:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B074C340F1; Wed, 23 Feb 2022 19:53:28 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 640C1C340E7
	for <linux-firmware@kernel.org>; Wed, 23 Feb 2022 19:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 640C1C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id s24so39469526edr.5
        for <linux-firmware@kernel.org>; Wed, 23 Feb 2022 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Id7gLQHKMx+QutSy3tPhG606eG0uppY8RxjJxXA7nNw=;
        b=nfP0/TUTFvI0Bgnwxl2ARIRvtRqF0RX9/VDvI/8ZVANfriAu/bHsn9sUCT17WbAr/q
         4LO2PzE4OX9qxD0hCp/CNWMBR/K3XXEwdWH3uN7EUKYPcp5fjNcqY0T9SZ0xJHmwatf0
         y55CJ1iGnrFp6Zg/L4v1FZl+BzyVpZggfN8Wu60mvmOIUT7gKzs/9xsahmH/UsOzfrfw
         Kd3UcromWF7jwwUCZCBNIxLEeAz2PKDlUr74Fc9yNoxw5EWvXA8FhtOekd7ptQ5c7tYf
         uLc9cN9bFQC1DHttpQlbRJgdFKROaXh82A4k0l6JgF508sBMeFeLbTRDoquL/lImpA2+
         uxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Id7gLQHKMx+QutSy3tPhG606eG0uppY8RxjJxXA7nNw=;
        b=BaJSF65i1QBEC+souSmg2gVDjAZqDclLAbB/TbgWl2o2tIFvW4AfbuPE5NAr2qNN2U
         UtiaI/nt+rZBvKzeqokRw+foNmgzGj5TP+u5/G/3lcc4LOBZQz4hOGNNLm20Q11CjAiV
         cI4u4mmPauErh460ASobbMGfOsF9m/H8cewX8YpbFvUHaRaYRn7ECmF2xuaiibeb0znU
         CRZuszEaW398iRM018XP2cF4CVkW264f/1KunIzWKNlnNJcwPIZbIawMuYHdZsnSoksV
         JTFiXfU35uyRnLue6e0So3vCf4K/TwtSGoUdtEbbSrqA+p+DChcKIPdwuS+g5rdltd5m
         8HYA==
X-Gm-Message-State: AOAM532OD+KfWbMMHWdB/UrRG5oipHgeKCxSn7lzR/Be30zjRfLFOiJ0
	YtmL/4O3D3rHsliCFXTC8F/tcbQZcc8=
X-Google-Smtp-Source: ABdhPJzAxB4++MHSIAdXpeX+gKgOFrcFoLnI4/+wSoI7sbwlNSZ4clhNVhuYq3cl2XwGrQqvDS6xZQ==
X-Received: by 2002:a05:6402:142f:b0:40d:e8eb:1dbe with SMTP id c15-20020a056402142f00b0040de8eb1dbemr974004edx.421.1645646005490;
        Wed, 23 Feb 2022 11:53:25 -0800 (PST)
Received: from debian64.daheim (p5b0d779b.dip0.t-ipconnect.de. [91.13.119.155])
        by smtp.gmail.com with ESMTPSA id 23sm232417ejf.215.2022.02.23.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:53:24 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nMxhU-001Rh8-1l;
	Wed, 23 Feb 2022 20:53:24 +0100
From: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v2 5/5] ath10k: QCA6174 hw3.0: update board-2.bin
Date: Wed, 23 Feb 2022 20:53:23 +0100
Message-Id: <5ed7d88456e5fef317b71705c51247597e9ff2b9.1645645875.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <da7d9cff16246c5c8dc003248a0ec4832606b1c6.1645645875.git.chunkeey@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com> <63972ee8daa620c57eda5eb89221ecfeb55f46af.1645645875.git.chunkeey@gmail.com> <623e92dfaae9117e59c9ff9c9d1189295072d034.1645645875.git.chunkeey@gmail.com> <da7d9cff16246c5c8dc003248a0ec4832606b1c6.1645645875.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0>

556321a QCA6174 hw3.0: update board-2.bin
d1a9282 QCA6174 hw3.0: sync board-2.bin from upstream linux-firmware
c987e38 QCA6174 hw3.0: update board-2.bin
b44d86f QCA6174 hw3.0: update board-2.bin
8ba5ed7 QCA6174 hw3.0: update board-2.bin
3ce0d6d QCA6174 hw3.0: update board-2.bin

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2: sent to linux-wireless + ath10k mailing list too (Valo)
---
 ath10k/QCA6174/hw3.0/board-2.bin | Bin 715444 -> 723668 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA6174/hw3.0/board-2.bin b/ath10k/QCA6174/hw3.0/board-2.bin
index 0bc5ddabc3354269822edd75fb7ab329c0efd6a8..239db8985d7aecbb6662db917319512fdffdc876 100644
GIT binary patch
delta 47
zcmdmTRr|_RorV_17N!>F7M2#)7Pc1l7LFFqEnHh(O)k)6nZDp9M<|nt`F8z7j7Q}G
DvL_Lq

delta 29
lcmcaIRcFgp?S>Y{7N!>F7M2#)7Pc1l7LFFqEnHh(0RXGF3ikj2

-- 
2.35.1

