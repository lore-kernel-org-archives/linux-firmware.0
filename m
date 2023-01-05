Return-Path: <SRS0=QwZl=5C=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A16EC3DA7A
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Jan 2023 21:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2114C433F0; Thu,  5 Jan 2023 21:54:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AE09C433D2
	for <linux-firmware@kernel.org>; Thu,  5 Jan 2023 21:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AE09C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id s25so40066250lji.2
        for <linux-firmware@kernel.org>; Thu, 05 Jan 2023 13:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H9VgDunViPVm0c06yXB3KlkmbUAVMrT7+ES0UJHmWc=;
        b=h7bTmNasTe8rhvHS84E6BpqSYiixrTRoilH4qSYJ8Os01IOxHG1GTFgNewoNQwDzdB
         X+rfUUnJnJowuvBukL7jY5yHKbjlSng40DodU4pDmAT6cT6XOxShYnaxVe4SURL1Iys+
         cbC0YvlJt/oag36lbtbQb4BrHAyqsg2Lpd8gJ4V2M9cUUi+R5SE66gtZUVMSVnPQi/Dn
         agxOGOU+OTQzeaL3VhIoYLjRjPNTf1xtW/gGvMqKnyQ5fYyDUNkQTplZnYkICxaNsbFr
         W2WsSzVWXtjFBjpV8+Svm/k2jvcXEgy4riWl6ud+vVlwl3gcs3zGT9ok0vC/LDFAWr72
         EuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H9VgDunViPVm0c06yXB3KlkmbUAVMrT7+ES0UJHmWc=;
        b=AiNVJ+biqpQqpMid1psQ9JPqR9fTeQlXv9naKtEt1zzRzGI5qQKxd1mI1UH7JnWLih
         3nyYWvMz0q/7y0QLctiLhX1jKV/e5LtjCikUbl4VDNRAvfvfU9RtXQoturR6x9DHgKgf
         HN3ZJcDYk03sOIb2IKC3b1fjDIonj0c7655WGSQ6FzH1JVZmJ6euoK8NhKyQypjuanmU
         VsOEKe3ER/JtlQj8SUV88ZXPgUb/nHjxNnWWPvN4PLlao+gyO1vDiBiyPsUJ5e97R55h
         f0uVxrQTDM68MEhv0KQvfSho9fpAtNcW9RKHgvQEklufp1Y88DtI/ixNrorIw/p4+0U3
         8rJg==
X-Gm-Message-State: AFqh2kprYGbwuDs0zsT/60sY6/Q/vaNJyP5Be7QHhNZcsKsyaiw8IkmC
	cRvByEk/KQTt7JIxrnIwUMWusA==
X-Google-Smtp-Source: AMrXdXug7mzvYB003Vy5Xw7LB0g5ckikyWB7YaXdSgBlzWZvACXOY1j5xtLffmAXq+H0n8M/440SOQ==
X-Received: by 2002:a05:651c:168e:b0:281:878:292 with SMTP id bd14-20020a05651c168e00b0028108780292mr1563604ljb.52.1672955693090;
        Thu, 05 Jan 2023 13:54:53 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id p13-20020a2eb98d000000b0027fb9e64bd0sm3471719ljp.86.2023.01.05.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:54:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>,
	Stefan Hansson <newbyte@disroot.org>
Subject: Re: [PATCH 0/8] brcm: add firmware files for brcmfmac driver
Date: Thu,  5 Jan 2023 22:54:51 +0100
Message-Id: <20230105215451.135111-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207230556.383935-1-arend.vanspriel@broadcom.com>
References: <20221207230556.383935-1-arend.vanspriel@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arend,

thanks for this long due update! I have tested the BCM4330 SDIO
firmware on the Samsung Janice (GT-I9070) and it works like a
charm!

I notice the absence of a new BCM4334 firmware, could you send
that too, if you have a latest-and-greatest? Some people have
problems with wireless on the Skomer (GT-S7710) and maybe a
proper firmware would solve it.

Thanks,
Linus Walleij
