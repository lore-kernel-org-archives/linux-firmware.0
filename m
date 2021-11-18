Return-Path: <SRS0=cz51=QF=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4278BC433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Nov 2021 17:08:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 29F2B61B2B; Thu, 18 Nov 2021 17:08:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E65D96135E
	for <linux-firmware@kernel.org>; Thu, 18 Nov 2021 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E65D96135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637255297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YZ8utjHrgjChv9lmR90QsqHjGVllKAUx2pNp1PZxP2E=;
	b=K+89f55hS7T6+M58OEIlNuWiOsBvlC0C3jb4dewNYZrv+M47zuXK3ruA1DgJ2sff5gdmmY
	IUqnR1nwRdam56Eo8kWKvA/9diVkjxIC2+k2BTCZQcB3YtYpuXKNtP6aQqwt4iMWhekg36
	a07jaqjZmrngeUkcmvNCzieQD0KdYxM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-8XfCZdweMFiLWduL2yPpyA-1; Thu, 18 Nov 2021 12:08:13 -0500
X-MC-Unique: 8XfCZdweMFiLWduL2yPpyA-1
Received: by mail-ed1-f71.google.com with SMTP id r16-20020a056402019000b003e6cbb77ed2so5888916edv.10
        for <linux-firmware@kernel.org>; Thu, 18 Nov 2021 09:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=YZ8utjHrgjChv9lmR90QsqHjGVllKAUx2pNp1PZxP2E=;
        b=JcSLW8KmrtGOhjlqTXSkNFuiIbW3cIQfL/VwNVUVQhwmeOPthyg7QidPJV4nyZO+K/
         v7Dm82C72h7FkMs8+t0ExQ2PA7iexOqBFEg9rsbQfAj+Q/zf7KDl95gFIsig2M1O5UQ0
         fL3o+g39+7AcAV8DUk1xShJusOYdFPOlffs1jR36YOV1YoybmdELgKimpUK7ppXYQzsF
         f/Y6GCD2lJulwobJnBDgM853Kssi9YraQruXqx/D51cCqzg3IQS4xYia6TrabUlNfZVU
         euBN/VQPTFZN4nWfpvzf0XGWEd7CdqPpvXvdY7O0GYAV/FA5h3QDp3LR70RRDXgoUcBp
         gSvA==
X-Gm-Message-State: AOAM531fWiGEF5LkTxB7cC5E2ZRvIwQHX2J8ipbBd4rnIstLg8O7XZpg
	kGP9yQm1FR+TBQqF8YBHDZcXGkPhpInAVhSUbZTyRWa9zvQ0qxkjwp3HxEMaUTn/J0Lr3BM9DAb
	pvcbynxn3Nstn3iFzGFVl
X-Received: by 2002:a05:6402:2792:: with SMTP id b18mr13458906ede.329.1637255291792;
        Thu, 18 Nov 2021 09:08:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyS3kiawhCw/b/xxnYxgUbsPZjLFdCFyY5foFlrVTpf7FAodoScNyvswR9dJqd3jFWlpKOKcg==
X-Received: by 2002:a05:6402:2792:: with SMTP id b18mr13458885ede.329.1637255291641;
        Thu, 18 Nov 2021 09:08:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sd28sm185749ejc.37.2021.11.18.09.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 09:08:11 -0800 (PST)
Message-ID: <b44d854c-571c-2e69-51ff-f17c13cb135d@redhat.com>
Date: Thu, 18 Nov 2021 18:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 Jouni Malinen <j@w1.fi>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [linux-firmware GIT PULL] Update ath10k/QCA6174/hw3.0/board-2.bin
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Josh,

Here is a linux-firmware pull-req to sync ath10k/QCA6174/hw3.0/board-2.bin
with the latest version from:
https://github.com/kvalo/ath10k-firmware/

And add 2 entries with the board-parameters for 2 Microsoft Surface devices:

Add eeprom_ar6320_3p0_TX8_clpc.bin used by the Windows drivers on the
Microsoft Surface Go to board-2.bin with BoardName:
"bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370"

Add eeprom_ar6320_3p0_Parsberg_clpc.bin used by the Windows drivers on the
Microsoft Surface Laptop 3 to board-2.bin with BoardName:
bus=pci,vendor=168c,device=003e,subsystem-vendor=045e,subsystem-device=0001

The additions of these 2 extra entries has also been submitted
to the ath10k-firmware git repo:
https://github.com/kvalo/ath10k-firmware/pull/11/

Regards,

Hans


The following changes since commit f5d519563ac9d2d1f382a817aae5ec5473811ac8:

  linux-firmware: Update AMD cpu microcode (2021-11-15 12:49:19 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git hansg/QCA6174-ms-surface-board-data

for you to fetch changes up to 4d74f4dec175363fa24c95702dd86f477cef232c:

  Update ath10k/QCA6174/hw3.0/board-2.bin (2021-11-18 18:06:53 +0100)

----------------------------------------------------------------
Hans de Goede (1):
      Update ath10k/QCA6174/hw3.0/board-2.bin

 ath10k/QCA6174/hw3.0/board-2.bin | Bin 633360 -> 715444 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

