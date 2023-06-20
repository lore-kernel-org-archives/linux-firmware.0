Return-Path: <SRS0=REvH=CI=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07ACEB64D7
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Jun 2023 14:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AE5FC433C8; Tue, 20 Jun 2023 14:25:38 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CA66C433C0;
	Tue, 20 Jun 2023 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CA66C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bd77424c886so5043088276.0;
        Tue, 20 Jun 2023 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687271136; x=1689863136;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocv+H9mKQcZiQt0cIp6m3Y7+WHnOJ23GySLX53awNSk=;
        b=nC9houheahpkMe/wnEJnEEBXzmynsqFMCZZUkUlgdpcOE4bNiNZ2GHZckEZ0JofABi
         MAslHZHVW8W5wa662u1WWIBXRAB3oETyFWie6cn7z9SFDDEg3WnUwfEuhALUK+2IUbGD
         qP7vdTdJDBp0S7CFC7owUcwFRwuu8RYG2sm2YX/R3siA1HhBR+7FZ1C3VQd73JnDFo58
         ZepzkV28VhURwGCzKcyQCifBudS/2Fwpm6xOzDy9Y5opj+B7CBM6B6lCKtdG80NFhNKz
         ahzytpIoB71QYUUAJ7/kEVFvsCJo1bRkQvwx2Y95Bhyvd5FkTEEQ4vlNB+JZXsHo/Njr
         i4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687271136; x=1689863136;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocv+H9mKQcZiQt0cIp6m3Y7+WHnOJ23GySLX53awNSk=;
        b=HCMJzrrvi4PHD9mIswfmxcJLGiOdVb7ByIyBIb84T7tsIgq8j2bdaWy6w1838iyPnG
         zzcO+GKMo2eaDL1sPamhIazeEs4P6bZWvZgqRYdpioQqsb4ym6KvjncOo1QzmRe5TEip
         bapjcBmQmXIVF7bs6GZMXHQ7NZd5VUbo22oQfGFDkqJYRLaLxb+1dO5t4o5wEotkhvpU
         Pd5XcATHQv47QK6U/fq/tIO3rSOjijN6eC+MsAUFNAvXjDAx9QPAAzZt+yoNRS8YB1P2
         yCCMP7Gujg5CZbtAkxNHvpf0Jy3yupmmKfEdM/xnD+xVMFbBtAlsK55W7cVboTmfZv/6
         SweA==
X-Gm-Message-State: AC+VfDwCKG4a3yh748eGDYyhIm2lwUBsmGGrtrK7o9agkvgzIZnxobve
	tsJydNG5Whu7KBQvImSTZVpaJctTHt7ve+ENzvuN/MGD3u0=
X-Google-Smtp-Source: ACHHUZ7EJfeRS6pEavl1lBseRWJOFZCD7r33gJdxExejTHrxyv49Nsyhz0ghS7/UMmpaMmwQB/a4MURa3WGSj2Lcf5s=
X-Received: by 2002:a5b:ccb:0:b0:ba8:5a5a:8b23 with SMTP id
 e11-20020a5b0ccb000000b00ba85a5a8b23mr11606371ybr.40.1687271136050; Tue, 20
 Jun 2023 07:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 20 Jun 2023 15:25:24 +0100
Message-ID: <CACvgo53fiiG52=khyqE+X=kkxRoQ28JUN4E+vYt3SCU_MNQNKg@mail.gmail.com>
Subject: Re: Misc fixes, sanity checks and xz/zstd compression
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jun 2023 at 15:14, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hello Josh, everyone,
>
> Here is the third, and hopefully final, revision of this patch series. In a gist
> we have:
>  - extends the existing check_whence checks
>  - fixes a bunch of glaring issues with copy-firmware - props to shellcheck
>  - adds xz/zstd firmware compression support
>
> Note: despite being sent as a single piece, all the patches (apart from the last
> one) can be picked independently.
>
> With v2 we have:
>  - dropped already applied patches
>  - dropped copy-firmware.sh changes, as requested by Josh
>  - couple of extra fixes
>    - copy-firmware - drop backticks && quote - code used to be removed with v2
>    - strip quotation marks in check_whence - quoted filenames are here to stay
>
> Josh, sorry for the delay with this respin. Hope all your concerns have been
> addressed, alternatively let me know and I'll send v4.
>
> Thanks
> Emil
>
> Link to v1:
> https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGWOP-Pb8oGo1BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/
>
> Link to v2:
> https://lore.kernel.org/linux-firmware/CACvgo52CK-sJjx26tEz=ec2PqqFz0bWuUMgUNjtZEjGm8f7mig@mail.gmail.com/T/
>

Josh, others, humble ping?

Thanks
Emil
