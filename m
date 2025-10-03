Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08ACCCA471
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 17:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96777C4CEFB; Fri,  3 Oct 2025 17:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B8DC4CEF5
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759513517;
	bh=G1BY0Yc6dmsSk9hUSr8Hz0XT1/TqtNcn7DpLQQsaCXY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Yz+7PCJmxRYV/zUURFFiOdbinNR9zhNIvVFW1zTkXRU3YwLv0mVbX1KKBnrw9Gm52
	 exLE9/Dgn7/32E7Ih37XpP6S00Ac69wrGx9gKIRkj1rLA9HVJjRaj0OrfMlL588ycj
	 MyqqPg7/4LKBqKNXCoKkh6+/Ck2O9VvkSjC56JsEpRZ2zPQYkrw2T3hsM6xyFt6R28
	 6tOJq2t3V7NPWCqj4EgCxganGlJCH/6iB7ZOgkAkGSDPbHGL/vheJ4eVYXcTc50pmj
	 0rCLcqTdIJuosA02YEWjTTluDhRWWdHZc1FK1JhjshqM5o0nvwHkVGBUqLMEpeq1W8
	 BV80kRvweu+kQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6352a77add0so3397986d50.1
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 10:45:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHwRyx6g/N9E9Rd2W7LTUn2E62PrVxdbOnp0gx65zOVSJ7NSx3
	A1D4B51XNDDtkPUb4XKT8s1lClG2zaaHCYs6WnIus0ax+mH0EBPnXb32/RQ9mwBgm45Q5LQ83IQ
	ja+AS0d4K7TY7cdG3bgWoUQLqtqj1I6o=
X-Google-Smtp-Source: AGHT+IGfu8ozPIffEy/2coRQdhPXe9xUVnSw7Fz5+DmVCb2sqpmhew0waoijppzbVDN3mglMkfW7mlfI/S6uNoWptnk=
X-Received: by 2002:a05:690e:ece:b0:62c:aa66:973e with SMTP id
 956f58d0204a3-63b9a0543d7mr2975952d50.5.1759513516762; Fri, 03 Oct 2025
 10:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <765d16fe-7ae1-1af4-6349-f69bc748e720@oss.qualcomm.com>
In-Reply-To: <765d16fe-7ae1-1af4-6349-f69bc748e720@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 3 Oct 2025 13:45:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6L3-whe7y5SqtakTX4XcL_nvoWi8BmVhdHutC4QA-C1w@mail.gmail.com>
X-Gm-Features: AS18NWDXaA0HbbiwwT2jKe-ji68YnPtK-E9iwCeSG_DAFNlmnSwiqg1FMwTkHLw
Message-ID: <CA+5PVA6L3-whe7y5SqtakTX4XcL_nvoWi8BmVhdHutC4QA-C1w@mail.gmail.com>
Subject: Re: remove link for Kaanapali video firmware
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/722

josh

On Fri, Oct 3, 2025 at 11:45=E2=80=AFAM Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
> Hi,
>
> The following changes since commit c12b12c3bf89f0d9d038d4274c6b36b362af03=
ef:
>
>   Merge branch 'amd-staging' into 'main' (2025-10-01 22:13:43 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-kaanapali-update
>
> for you to fetch changes up to 6680b8f606d96773fcf966dd5bcc6a467c94bb05:
>
>   WHENCE: remove link for Kaanapali video firmware (2025-10-03 21:12:33 +=
0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       WHENCE: remove link for Kaanapali video firmware
>
>  WHENCE | 1 -
>  1 file changed, 1 deletion(-)
>
>
> Thanks,
> Dikshita
