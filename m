Return-Path: <konstantin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD9CC352A4
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Feb 2020 20:27:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ABB5B20838; Mon, 10 Feb 2020 20:27:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8B020715
	for <linux-firmware@kernel.org>; Mon, 10 Feb 2020 20:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O5TyC1oH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8B020715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=konstantin@linuxfoundation.org
Received: by mail-wm1-f48.google.com with SMTP id p17so722580wma.1
        for <linux-firmware@kernel.org>; Mon, 10 Feb 2020 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=zNwkcNWupqtYgAQUSwVtW6Ue2PAGx1TP7Bycb06sKT8=;
        b=O5TyC1oHnvqBFk9HOu8Ekg78PLEdB7e9jeHGacfZFGNz/nFuZve9dycS089W3WwNJm
         FH5uCNx9v1xd6T0pZ6Xsm5XGXor38mMe6vS24OXVd4jUMy3+ivoCnZYLJfD/iUoOxOnW
         a9MwI2QreLT/gnLRo1eghAOVKkfFciPqS6+io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=zNwkcNWupqtYgAQUSwVtW6Ue2PAGx1TP7Bycb06sKT8=;
        b=pusFFxICkjKC01dyng+4zrR9Aa9hNR8ZJ92rfkiuVlCQ+tytsO23PRgYDcIFLq9kzC
         58OBmqIm1KCPrJkNDK82nfcZU6z0/TsCow2Pa9mDQhw/0/Q1qfuFXe7euHENrK6xddFK
         2YDmPwZ8M5idjG6u0BRElSPln4EgWQOHsfLn0u/jBnHDV51cgauzhMKo5kQs5okoLU64
         UHG9iO/CiYREU9GdqWhGor06jV94RllorDAbj1C4kXkvRyr/Lt5eAO8IaxWCSx/6xvDD
         FFt6j8YliX1OGuGCRaMEwuETcSYZCoLVy23GnXnoW8CCX2MPNxa6lXdjItq2plu3r5em
         HS5A==
X-Gm-Message-State: APjAAAWgcz9r+Wt69sRHiYMN6NF9ogK1kq6TkxCg7MMd4/ojx5KqN1UP
	Thmt85GFgJJ2G/HC3gH6sW4M03OoyHVB9A==
X-Google-Smtp-Source: APXvYqynDX5KdCeruJ61hBz+6m3im7DqJZxUG2XlANnlyoqfcIQmqxFTbNFx1O73y7C1bxciUYZyPg==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr729731wmj.2.1581366450133;
        Mon, 10 Feb 2020 12:27:30 -0800 (PST)
Received: from chatter.i7.local ([185.220.102.7])
        by smtp.gmail.com with ESMTPSA id g18sm541425wmh.48.2020.02.10.12.27.28
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 12:27:29 -0800 (PST)
Date: Mon, 10 Feb 2020 15:27:26 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Linux-firmware is now archived on lore.kernel.org
Message-ID: <20200210202726.ooo3hfrslj2krkoa@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

After a conversation with Josh Boyer in the #korg channel, I set up an 
archival location on lore.kernel.org for linux-firmware. It's not a 
"real" mailing list in the sense that there's no subscriber management 
outside of opening a support request, but this should allow you to use 
get-lore-mbox and use other niceties like archive search.

https://lore.kernel.org/linux-firmware/

Best,
-K
