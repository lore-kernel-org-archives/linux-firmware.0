Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604FC7EE23
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AAF9C4339B; Mon,  5 Jun 2023 14:14:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49738C433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49738C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso4452531f8f.2
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974455; x=1688566455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUg/UcQr3OSC2diBUfH8Oz4QiqDUtx5++Co33b1pdRg=;
        b=a9mRCVfPdSHLEPXeevIR+2mORJBWmnweBOESrA0PM0llTN45/AfInVn4GMltrDoqfP
         xETZRiEeJiZMdoAyZWJZwanV3nC4Vfft0KLdg+JjtJbYCNNUuJV4ty4uZI7VLProClGV
         G0qdfNCpVyb9xOGfl/vxxKOyQ2JMHpj25Ck6U7Ri2p3LU5aH56yyd+PBkpwfQrxTUWtH
         7RlQPsZ9tdbYrDxQL6XdqS97iVGxambwsghbLkC1bzv3XsqlBWIhmjHkjfXHeWUPo2AJ
         qvqMY2lwMYpYqtEcBYiVyo8MzTDv6yzoQmWm20tFzI6QpCGRXxwxVyl6rsnYgcFQXrjD
         kxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974455; x=1688566455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUg/UcQr3OSC2diBUfH8Oz4QiqDUtx5++Co33b1pdRg=;
        b=CKVsbyyHmoATPFdGxMsMX9fY/D6OHOutikc89pI9JRvIu5Mh3Opscy1lHehCvsVT7O
         xlO+aSBqeXDVAeuexi9r31kqGaVwxs+8hV9CVwWK2sifuga2fvJGtHEH7+wGrjhqoMIE
         jDUcTzj80rkzvMR6SW3TBRVibqDEW6Ayoj6NMq/SRDcQBuePb0DPi76UwEd0wVA3x5JV
         8fBMPGMPFkN3yo7sFnIoE6KAu6BmidXghF8EA45Pd9qx+Ro1iaofiWXO4CF5OUonlrxi
         l1PzMveoPPCXrorIjwtu8wEzfvg25yVLnqJqljgSslmBvU7tlxLNMKCi6GLEGncobdiq
         9pCg==
X-Gm-Message-State: AC+VfDwJNwCGrGldS+d2edWlX6rdIJCKs6X3ME3GJp+x05jxr2LJWWC0
	Xyr32ULXROGHaJsx/UnYo6QItQJNQCs=
X-Google-Smtp-Source: ACHHUZ7knr0AfgKUnFATSAeVUZbqJn85VUf/RHQdUqkKwz6zt8SVRXSzw3TeoJeLe111nR05aCuQeQ==
X-Received: by 2002:adf:f186:0:b0:30e:3df6:b994 with SMTP id h6-20020adff186000000b0030e3df6b994mr3738732wro.38.1685974454901;
        Mon, 05 Jun 2023 07:14:14 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id g7-20020a5d6987000000b0030632833e74sm9930483wru.11.2023.06.05.07.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:14 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: Misc fixes, sanity checks and xz/zstd compression
Date: Mon,  5 Jun 2023 14:58:04 +0100
Message-ID: <20230605141343.880621-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Josh, everyone,

Here is the third, and hopefully final, revision of this patch series. In a gist
we have:
 - extends the existing check_whence checks
 - fixes a bunch of glaring issues with copy-firmware - props to shellcheck
 - adds xz/zstd firmware compression support

Note: despite being sent as a single piece, all the patches (apart from the last
one) can be picked independently.

With v2 we have:
 - dropped already applied patches
 - dropped copy-firmware.sh changes, as requested by Josh
 - couple of extra fixes
   - copy-firmware - drop backticks && quote - code used to be removed with v2
   - strip quotation marks in check_whence - quoted filenames are here to stay

Josh, sorry for the delay with this respin. Hope all your concerns have been
addressed, alternatively let me know and I'll send v4.

Thanks
Emil

Link to v1:
https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGWOP-Pb8oGo1BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/

Link to v2:
https://lore.kernel.org/linux-firmware/CACvgo52CK-sJjx26tEz=ec2PqqFz0bWuUMgUNjtZEjGm8f7mig@mail.gmail.com/T/

