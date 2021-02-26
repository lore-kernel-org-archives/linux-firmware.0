Return-Path: <SRS0=ZkDW=H4=superbaloo.net=baloo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E3FC433DB
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Feb 2021 07:09:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 021E764ED3; Fri, 26 Feb 2021 07:09:09 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9229464E46
	for <linux-firmware@kernel.org>; Fri, 26 Feb 2021 07:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9229464E46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baloo@superbaloo.net
Received: by mail-qv1-f47.google.com with SMTP id dr7so4104619qvb.1
        for <linux-firmware@kernel.org>; Thu, 25 Feb 2021 23:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=superbaloo.net; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=pbcWbsNbJuoniv8OZve0TSg9DYNqZLCYZLAQa6wbooc=;
        b=aUXEDGiKhigfFup60fRirTQklyoUcuyi/LuscUDFzhkNS2D0KtEEXDWXsgCuhCm2BK
         UKfD/8j+bZbpceLyJy3B3lV5O+WMrL9UsNzU4aZby4ZH+0GHSf5pdlBAzHiyxelApFYa
         3N95xcK9xCxNBoZrhcGc/ObeEeQJH8xKMKfEzg27TVJqNcXByC9d9zpnLT9tWT0hXgol
         y/vlmAiD+N1VfTXk1UfqEYkZC0svM89/f6PVFIRvfMl9EEt5Eh581twO2jPWUQAaf3j7
         cflzvrZWYBEJXBEcUbW9y67vmG+5l5fAYg4rqSZRSrBLcFgcb7lcO9hCZ4aTQChMeiUc
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pbcWbsNbJuoniv8OZve0TSg9DYNqZLCYZLAQa6wbooc=;
        b=R69vld5yhIC7JEwXVl5Pu8emTjgAgp8ZXWoaSIouOk1aNhy5gxA26OH6Xbun3urmyh
         qzK+7yKgs67qksBgpBa1JII+dBgpC6mTz4OUY3WIc2XuzDRORW3dwdo56aUHHMarzYSu
         p/jG8IvIJyzzJoasTjOXI9ngXckeaUFI/Sa8OrkUNw7XXTTl1MEULBVt2AzSJCB46cd2
         MC9RKg4t3oH8JhVS8uirc1Thka23zBk5//k0HN9Viq7OHVYf6NooTX0JglnKRTiTomas
         P8YpeNMwTacVn8UjezvUpxo5z0lG3Y00eVvqT1ho0f6/SUEWUC9t+b03HyOD2P14nQNl
         Igkg==
X-Gm-Message-State: AOAM532Gpe5qn5Isq3qOeXjmDL1+mvgpcY+hRpoNesRM79LLiA1ocwII
	LoVBJfHEfPTyeBAGbtc2gYuZMk+h2IIbSnKPijKLeml57N/BSA==
X-Google-Smtp-Source: ABdhPJwaQuRRlYHiVse0bdCsFS3QSNR2hdPzvfr7OrWoX2fbchh7OdgTyBlFe6mds9n6BxkbQut0aYWA6fR+mqaCKIo=
X-Received: by 2002:ad4:4581:: with SMTP id x1mr1579785qvu.9.1614323346317;
 Thu, 25 Feb 2021 23:09:06 -0800 (PST)
MIME-Version: 1.0
From: Arthur Gautier <baloo@superbaloo.net>
Date: Fri, 26 Feb 2021 07:08:55 +0000
Message-ID: <CAOAHwbXHed7SL7hB5oRKhXbH4PiwD37pHGzudG=NAgM0LZZKPw@mail.gmail.com>
Subject: linux-firmware git repository corrupted
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm not too sure where to report that, but the repository for
linux-firmware located here:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
looks corrupted.

See the following errors shown here:
https://github.com/NixOS/nixpkgs/issues/114439

Best,
