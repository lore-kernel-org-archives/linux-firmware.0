Return-Path: <SRS0=0uQH=AD=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA50DC77B6E
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Apr 2023 09:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 679DCC4339E; Wed, 12 Apr 2023 09:46:24 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47CCAC433EF
	for <linux-firmware@kernel.org>; Wed, 12 Apr 2023 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47CCAC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id i20so14716393ybg.10
        for <linux-firmware@kernel.org>; Wed, 12 Apr 2023 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681292782; x=1683884782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNuVbYyBnP1BcaPopnX8lztKblurkV7/rLoacjW6Njs=;
        b=yAaY1KHIpqwcoP5byyGOts6dHMQUhWaW8lZyTtgdsRUUgDlaAHH395rOIxlekGq55a
         bAxYgNjrF5/lwJqeiX2SZRIlVk2wO1odlGdLhDv9ZjZ2OumLC3qfrIiMQFHTAFqR25OA
         Tq4XhZxEjZAvYzp36dH5BRB6SW2vYxt8LosNPecG+dyOaNI09RB5a/JtDX8MusxhsSzW
         Byn8erPSpBIlhHXnSrZzqjRlaYIdmdM+8LkwtNvqrZmqhF8RoY5A57vLjejbupdPrGyj
         Win6bDULj8RGrz7JGPWkwlJEv6Gygsn0CLc+x8I+UaVtZentrbTSPAYiXwEANqQ3N8ED
         beMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681292782; x=1683884782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNuVbYyBnP1BcaPopnX8lztKblurkV7/rLoacjW6Njs=;
        b=ASOSUDehfb0XupBFcDF1u1YKaCR/2Zbce6OPa1MoftB3A4d8qUOb0Szo4BQk/3AVWf
         XBwmoJRET2DGorkr18Kix3D/ToZo+CWsFlGCaqg+U7mUj5jNnfWaVP662FUuBFhLVBCL
         AbH8E89SVBV+Yi4h8DDLeirMDO407JA4eTfDYgj/Z1GrzeBgU/jtKO9nEPjdsDhzXOOQ
         Nc9vw2WOlxHHMqZbEWiQO+kKwUSngv1onwNsS6I/rmNTjCSUxj5RHLREOZ/Q9le5mabl
         9rVZJQDVXrZ6fuW0k80ExHXSCqvQkfObNevAaX3EPEEmsLsUzI3HbXj/y/IB0bRkKo7m
         hM4A==
X-Gm-Message-State: AAQBX9esX2QjqkwoFthsJK7KtrlApI65DK1J+A7ZM7x6G+f28wHSOY4T
	SIBCt+c+jYb8mar+AaqA5AfwVuzjN5s0wNOy5JXi/A==
X-Google-Smtp-Source: AKy350bOIfX5NAzv6KgxUT2B1YGM2RvsdUbOEM86g0uqawtzMv77LJ92an89N0cSH4dLXjtnO5ExgpcLpL6DNZjWOTY=
X-Received: by 2002:a25:da8e:0:b0:b8f:3647:d753 with SMTP id
 n136-20020a25da8e000000b00b8f3647d753mr1197484ybf.9.1681292782236; Wed, 12
 Apr 2023 02:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <87cz4ia35m.fsf@kernel.org> <8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org>
 <87jzyh8mrw.fsf@kernel.org>
In-Reply-To: <87jzyh8mrw.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Apr 2023 12:46:11 +0300
Message-ID: <CAA8EJpotq5KjbUAU+exR5uU9-9erFhdxPn_OTUJ58MrXM-Pngw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Apr 2023 at 12:36, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On 05/04/2023 16:07, Kalle Valo wrote:
> >> Hi,
> >>
> >> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
> >> board file updates in multiple hardware families. For ath11k we have new
> >> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
> >> firmware update and WCN6855 has board file updates.
> >>
> >> Please let me know if there are any problems.
> >>
> >> Kalle
> >
> > Excuse me, a gentle reminder regarding WCN3990 board-2.bin. It was not
> > included into this pull request.
>
> Oh man, sorry about that. I guess my installation script was buggy and
> missed it somehow, I'll look at it later and make sure WCN3990 is not
> skipped anymore.

No problem, thanks a lot!


-- 
With best wishes
Dmitry
