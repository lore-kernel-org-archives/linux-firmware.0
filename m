Return-Path: <SRS0=rdXv=KG=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE082C433ED
	for <linux-firmware@archiver.kernel.org>; Tue, 11 May 2021 19:11:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B58C061626; Tue, 11 May 2021 19:11:09 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EA861585
	for <linux-firmware@kernel.org>; Tue, 11 May 2021 19:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EA861585
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=briannorris@chromium.org
Received: by mail-ot1-f42.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so5013065otc.6
        for <linux-firmware@kernel.org>; Tue, 11 May 2021 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFnrqDxgmbDsaVUtrV/oF1WpAJvkWaxKP9Bq2K33Wvo=;
        b=b09ytGyivhbI8K/zbZcp9sDKhGmjau2pkv/7ypBP4Mp/rl0wCKVXl3JpZuLmU/YOpp
         2ZcXFsCdRAOVBfwYE/0j2kmsvLb44az0BQXzaAB4ZATnjMVIwwh4sVG1rwwqGZD42t/D
         Oux/pXwt6aTWiW+7uplshgZg7Bwd4csK1oJIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFnrqDxgmbDsaVUtrV/oF1WpAJvkWaxKP9Bq2K33Wvo=;
        b=Z+/NzRzSuyMKrgegrf0ok2AJkQkNz2jJmdTgzCrTV1E4/Beccyw3tnxlyqGgr4q0k0
         IFNmG52CfhAgHMacktvQRaKxHcXAbSfuc4/PuwopFmPx1hYCokgzPwmP5wMFe8nSKgSJ
         1h0GOYzQl6GFUWihVzXYTWCbD6yABELpH/vTkoS2bVbJGbhZb9eNz2RMSqXCzZssGlqa
         75ce2aljvZahpHMpigzcIf78/GUX69eAjgv6C/0mH8nv3EuyvjxCLXFgWSy1DYf7vJ+I
         pFsfhCd+K0SfOEJfqDYpIyKqhMA684R7fvqK9w5RacX9RldzjcrOm4O2NPlfnkVNU2Nk
         IKNg==
X-Gm-Message-State: AOAM530lV1t9bscKr1vYSXo+U/ElJjzfqbgCxWuaIva320GIIEc3q1rI
	i66F5CvZDcpYc87YdjtA0CKnQCIl8YCshQ==
X-Google-Smtp-Source: ABdhPJz9zgnrB840UeHmuIFKo6Zd5cv/+3I7fzF7NcUKpOozCNbpu34uXq7DaxzBs9WOTqnx+k33KA==
X-Received: by 2002:a9d:664c:: with SMTP id q12mr27925608otm.76.1620760268242;
        Tue, 11 May 2021 12:11:08 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id h6sm1861066oom.21.2021.05.11.12.11.07
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 12:11:07 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so18459556oth.5
        for <linux-firmware@kernel.org>; Tue, 11 May 2021 12:11:07 -0700 (PDT)
X-Received: by 2002:a05:6830:1bd8:: with SMTP id v24mr27430126ota.203.1620760267068;
 Tue, 11 May 2021 12:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com> <87cztx87tr.fsf@tynnyri.adurom.net>
In-Reply-To: <87cztx87tr.fsf@tynnyri.adurom.net>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 11 May 2021 12:10:55 -0700
X-Gmail-Original-Message-ID: <CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
Message-ID: <CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
To: Kalle Valo <kvalo@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Pkshih <pkshih@realtek.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 11:05 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Pkshih <pkshih@realtek.com> writes:
>
> > Please help to update 8852a firmware.
> > This is first time I send a pull request. If anything is wrong, please let me know.
>
> rtw89 driver is not in upstream yet, and it has not been reviewed
> either. I recommend holding off pulling the firmware until the driver is
> reviewed.

FWIW, preliminary rtw89 firmware was already merged. This is just an update.

I also wonder, what's the harm? People like me are actively testing
the early versions, and I've done a very barebones amount of review (I
hope to do more). It really helps me to have up-to-date firmware
published somewhere central -- I guess I can take GitHub instead, but
again, why not kernel.org? If anyone else is looking at testing, they
know where to get the pieces too, and we can compare results.

Brian
