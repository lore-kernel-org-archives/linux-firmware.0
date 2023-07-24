Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78004C0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4683CC433C7; Mon, 24 Jul 2023 12:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F900C433CC
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201223;
	bh=SnlHflDJgQ95iCM90PHWjdc73vvDDKkpKmX/HQReII0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=imKHglPp2JSzaDxrIlBkhScjSdwf40p1zuepq6CgV7XvGCctcixbzFjra7eAHYF5M
	 Dso1TfC6YuK05BHwOUCCKbW6G6WoSfDRdzMm7EYH3o7SfBMtSXHMiPsLuzYS+g9+Gt
	 DLpFVf+Z4uDZt/KRGJFjaVxDjsewsK+rFunn4ydRSyzYTjbnk8j26uvYwvcAvjWQeu
	 rybIqnWTUwuLCnweSwc4EAHVSkG+kWL4n8VjcSUZQgyzGXnjQwfPII/gWhUghz4STV
	 uxYkpUP/88C2KI3yS+0qaN3kE6Q2LNGKShZxzfEoeNBIG+RFcOMEccQqxX+AJ/C/Vn
	 bhq1Y0RT3wikw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-57045429f76so51200157b3.0
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:20:23 -0700 (PDT)
X-Gm-Message-State: ABy/qLZTeOO9nvWloj00bVcXIIvVyxZLMNrAv+/fUZQGT+I0/6yC8RGC
	qVunDNgg5MNjQ50hLnqYr06pB/jfKBM5cGlk5fE=
X-Google-Smtp-Source: APBJJlE2r73AYR5L/ZQV8TRNYjpmkJTqoNlmYbuMid3tdiXvoHpjhJTF+3qokabZDUdfiQgNDmz0limgLzZg20TA+R8=
X-Received: by 2002:a25:457:0:b0:d0e:25f3:65f4 with SMTP id
 84-20020a250457000000b00d0e25f365f4mr2963266ybe.23.1690201221801; Mon, 24 Jul
 2023 05:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230711124754.1739-1-neeraj.sanjaykale@nxp.com>
In-Reply-To: <20230711124754.1739-1-neeraj.sanjaykale@nxp.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:20:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Fa0OW68YpVy5vQg8t2sFy9Aht5U46vtNnWMfELFp7Ng@mail.gmail.com>
Message-ID: <CA+5PVA7Fa0OW68YpVy5vQg8t2sFy9Aht5U46vtNnWMfELFp7Ng@mail.gmail.com>
Subject: Re: [PATCH v1] linux-firmware: Add URL for latest FW binaries for NXP
 BT chipsets
To: Neeraj Kale <neeraj.sanjaykale@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, amitkumar.karwar@nxp.com, rohit.fule@nxp.com, 
	sherry.sun@nxp.com, kundan.kumar@nxp.com, ashish.patel_2@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 8:48=E2=80=AFAM Neeraj Kale <neeraj.sanjaykale@nxp.=
com> wrote:
>
> Adding URL to find latest FW binaries for btnxpuart driver.
>
> Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
> ---
>  WHENCE | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index e53002fb..e6d24800 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6332,6 +6332,9 @@ Version: 18.99.1.p154.40
>
>  Licence: Redistributable. See LICENSE.nxp for details
>
> +Latest binary files supplied as a part of BSP from:
> +https://www.nxp.com/design/software/embedded-software/i-mx-software/embe=
dded-linux-for-i-mx-applications-processors:IMXLINUX

Why would the latest binaries not be found in the linux-firmware project?

josh
