Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D010C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:17:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CF296135C; Mon,  3 May 2021 13:17:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 471E861175
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620047874;
	bh=5Ikdkrp/SNl5LoDLZ3pqr8Pip8WIQT2/4kznStL1nVk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=D3ACSRYbD8R3se7BW4HDI+isCI5LgNL3e7RaAmSzSZHkQGrKogBNerd64ptTaLOuo
	 MqZCZ7w6nuKGtQwmGizutpFbgIjKAA0ZiYrTF0499LlxKWAVIDZjwXKF8n1eiUPLrR
	 mx+f8/M39Iw/VYuAqrHFACoOlQhJtYGa3vSs9I5DWBKqRuxehkak+Dls6u31kktcZh
	 CGWVJ83QsAcxAMivJSVcHEG1ULBwQ+aW+cI4miuucD7OsiOxyI1Be2uyw/EEuOgDWY
	 ONU9vMuy9l9W3xHj4OpNJ80mW5MjtThWWGrOR3XlDWC/1/AgbUTBWJS4Z2SAWfxdcK
	 AozUtnYVUiHug==
Received: by mail-il1-f169.google.com with SMTP id j20so3637957ilo.10
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:17:54 -0700 (PDT)
X-Gm-Message-State: AOAM530yFI+rqV07fIbvMM7z1R437s6O25Vp2rCfi2IPaoDEEx8WqIj3
	INUZyHCH2a2+msNPfLq7CFfwcjVoo4RgaWo8qE8=
X-Google-Smtp-Source: ABdhPJyw979eskg0smnx4aDWQEe+xx9PStqJehXWTB/DKOlTGo6JfLlMXG/F63BY+Q0SVyCgFZiSMta+bzQVOD3NAAU=
X-Received: by 2002:a92:c8d2:: with SMTP id c18mr16069467ilq.81.1620047873586;
 Mon, 03 May 2021 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com>
In-Reply-To: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:17:42 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5P02k+huwKP3eD7dxB2USDBS8vqR6Hq53wzccKkxRwaA@mail.gmail.com>
Message-ID: <CA+5PVA5P02k+huwKP3eD7dxB2USDBS8vqR6Hq53wzccKkxRwaA@mail.gmail.com>
Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021 at 5:00 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hello,
>
> Please help to update 8852a firmware.
> This is first time I send a pull request. If anything is wrong, please let me know.
>
> Thank you
> Ping-Ke
> ---
>
>
> The following changes since commit 2f4f0f826eed328675e8a84b1d80e41a25e94ec4:
>
>   rtw89: 8852a: update fw to v0.13.8.0 (2021-04-29 16:51:35 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git

Pulled and pushed out.  Thanks!

josh

>
> for you to fetch changes up to 2f4f0f826eed328675e8a84b1d80e41a25e94ec4:
>
>   rtw89: 8852a: update fw to v0.13.8.0 (2021-04-29 16:51:35 +0800)
>
> ----------------------------------------------------------------
