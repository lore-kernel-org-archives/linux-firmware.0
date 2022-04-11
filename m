Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C617C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 11:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48CEFC385A6; Mon, 11 Apr 2022 11:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32276C385A5
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649675733;
	bh=0jv/slLW15Hflf/rgO9oeqpsszfgZs7FERtKYSqbubg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ug6imVq6Jzu2udZfcheR4UTvqOwy3UBpoRg5qLIIcYx+smBXzvrvOsYQCiIB7H8Mx
	 UNHM4Z7sbnkEhvSQ6BG8uLfbz3gXw75+gPpuef4p2L9vgIIxgys46xK1SsK/+SIwgD
	 eEoprPniVLt+5d+1qeEuL9jtTEHwZE6br5B0A6RN1JWYZaqZOpcQx7a2qEUrXoVS10
	 6H3TDKpTvPKMr6Exv2oxAGjzdB4IeHxmFnpGw9p4srb+s/WqEhKNIITVXrMejbRHTy
	 KGx7jkXXiGrR8QR1g8igqF8XQKaxIg78heHtMyhpFf1GZ7xohZyeVQvMvQ+8Rpn+gM
	 lNLpbpa6Jmbqw==
Received: by mail-io1-f52.google.com with SMTP id x4so18220300iop.7
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 04:15:33 -0700 (PDT)
X-Gm-Message-State: AOAM531sJZyMWcv6g80DIdHpR0OnIIA+syYlHvPYlhvbDOX9RX6R/6rF
	SyiLaaL0F96KVjbcB8+H2MvvUsD4TNbqAmb4O30=
X-Google-Smtp-Source: ABdhPJw4oaXnlt7jTkHhJBxh6Cv7LB5kP5a9vxMtU9p6rmVpCxlzSy+f8rXffHIrNCj9o/Sw4fVmsYtVnAsEydg+OIM=
X-Received: by 2002:a05:6638:1248:b0:326:1859:cac with SMTP id
 o8-20020a056638124800b0032618590cacmr4200129jas.303.1649675732368; Mon, 11
 Apr 2022 04:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <3ea2314b865bfd4799fc5edd998439bba4e59f2a.camel@realtek.com>
In-Reply-To: <3ea2314b865bfd4799fc5edd998439bba4e59f2a.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:15:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4KDBLgTwEa=E8ze=P-8ZrZ8__cUB+ctotWE=YOaxLzuw@mail.gmail.com>
Message-ID: <CA+5PVA4KDBLgTwEa=E8ze=P-8ZrZ8__cUB+ctotWE=YOaxLzuw@mail.gmail.com>
Subject: Re: pull request: rtw88: 8821c: Update normal firmware to v24.11.00
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 7, 2022 at 4:26 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8821c firmware of rtw88 driver to v24.11.00
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 07338f9d33089aba6853cb7b3a1d9a8676c83580:
>
>   rtw88: 8821c: Update normal firmware to v24.11.00 (2022-04-07 16:20:41 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git

Pulled and pushed out.

josh

>
> for you to fetch changes up to 07338f9d33089aba6853cb7b3a1d9a8676c83580:
>
>   rtw88: 8821c: Update normal firmware to v24.11.00 (2022-04-07 16:20:41 +0800)
>
> ----------------------------------------------------------------
>
