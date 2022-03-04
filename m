Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C923FC433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 13:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B45D8C340F1; Fri,  4 Mar 2022 13:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E669C340F0
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646401366;
	bh=cZ4yc91fA47WKRSxGeDozx1EpR9zXQrhysw4cYcOq+g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dmt94sEhNIRau7ABbh2ECaGUj2NFw3YOb18PfXSn6o8dLWh43WWLqzhMvxwVz3QDU
	 w6Tmif67jLHmRMTCbb2+4VN8LSowVWrcppdcsP7E9dGFSwIR6E/qDNqNogyASP6xEI
	 b3vqKgmvBgJtua22gX88Lhr6pg6t8BMQ3wsS3/EzWz+gjNlV/nVbuNBvjCQHh40do7
	 tJm93c0LLwFnWH0ST91KHGr3RC6nYbxDMnyZFXDbogwrHw0LwRlPHGTVz2Dq2C+das
	 7Wq0hpGfXS2rOZFL6Rk5tCojLnoAvlI0jHVfhDVBcK2MgncN/81jv5hyHQiRpicNAS
	 HvcjjX9qlR17A==
Received: by mail-io1-f42.google.com with SMTP id c23so9576172ioi.4
        for <linux-firmware@kernel.org>; Fri, 04 Mar 2022 05:42:46 -0800 (PST)
X-Gm-Message-State: AOAM533p7FE8DlA2ujaJU2w29OJyBFP5h3F1vbZueDkbKWumkl4aqQki
	LSoIMtrvMu/T/CpdWwvsiCmEWH3Yr4nyYro9dFw=
X-Google-Smtp-Source: ABdhPJzljyeyN/IxyxkxxSAiZQJJ+SL8Xq4zfiq95LuvK5Em3rPo2108U3ShTVt0lj4E9MRTbAmSJCUNyssHOcvfQVk=
X-Received: by 2002:a05:6638:1035:b0:306:e5bd:36da with SMTP id
 n21-20020a056638103500b00306e5bd36damr34595680jan.145.1646401365751; Fri, 04
 Mar 2022 05:42:45 -0800 (PST)
MIME-Version: 1.0
References: <da10ed115e1a4cfa82a6ace518cb3c57@realtek.com>
In-Reply-To: <da10ed115e1a4cfa82a6ace518cb3c57@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Mar 2022 08:42:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7zSBBtUHKRaC1-nNmJwzbfFKvm8Uiav2oYESJD_pa3ow@mail.gmail.com>
Message-ID: <CA+5PVA7zSBBtUHKRaC1-nNmJwzbfFKvm8Uiav2oYESJD_pa3ow@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.36.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kevin Yang <kevin_yang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 12:00 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update firmware of rtw89 driver to v0.13.36.0
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 7f866a1f1da1de427fe2e2875d2c380460080b2f:
>
>   rtw89: 8852a: update fw to v0.13.36.0 (2022-03-04 11:49:01 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to 7f866a1f1da1de427fe2e2875d2c380460080b2f:
>
>   rtw89: 8852a: update fw to v0.13.36.0 (2022-03-04 11:49:01 +0800)

Pulled and pushed out.

josh
