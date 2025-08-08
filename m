Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7BC87FD2
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 11:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61651C4CEF4; Fri,  8 Aug 2025 11:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF0FC4CEED
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754653640;
	bh=GSv7HHVlpFRjB9Pv7IpPS3KIizdNokjcfW7ZL18klHs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WJA68X2sCAUNihIgvpIYf5D9M0wyqRyCwrjuFCAjWIkb2Rge9g9UQhF8aTnL9vft7
	 KkSQK5+DZqGJIs/t2OYkURSok8vAofy3dIEGye11n2TPB4e3jXx7f9IWE2/EPeM6EO
	 QWlYtV5wHws2zVaCDa4OC6qreIj4f8pdGzaSDkRMXvq3fPw7pzsw0VhP4j3YPeAklD
	 8DO1VTJsdIB6vIpGH1LJYlnyN9vLAI5Vz507hUmkbwO0lssgzpoecdwu5Ujky+NFR1
	 FuiaQqveN+j3U/DkxCHBVxUhSdj9PhVON7jqRAgyN37RN0XU5SVhdNCc6GMUKYQgVA
	 sjIgW5jgeFvUg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71bd9e38af7so19884377b3.1
        for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 04:47:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYpG7jEKYwI0Gt18R0REqHFP4DEXwCn0rPUQqHzOPpX5y/jJ0Q
	NSDEqiEuXaj9ueI3wIguHvIYwBe15oummIdhUY8j+J9XIFCys1MVL913EqKXw/AIg3iZ4MkL76G
	VFOyS32RVexUm0RJlCb0eFS/in1rTjp0=
X-Google-Smtp-Source: AGHT+IG3Tjht9a391cwl9Rikm3O6cvo/s5EwmKjypY1/qnCMfDcIl2krQtNIioZ39TnnbS/wl0+jGH7itWBGPzaMeOI=
X-Received: by 2002:a05:690c:6213:b0:71b:7043:21af with SMTP id
 00721157ae682-71bf0f9a20emr31492897b3.42.1754653639573; Fri, 08 Aug 2025
 04:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <3afa5092-f650-4e97-a20f-71be81735b69@oss.qualcomm.com>
In-Reply-To: <3afa5092-f650-4e97-a20f-71be81735b69@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Aug 2025 07:47:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Pc8v3DcO9JQ9URjtx_5FZPmk_wp=pu+Ke8n7HUY4JmQ@mail.gmail.com>
X-Gm-Features: Ac12FXwdPyPqGaivrMxaxdiw514cElf1vyivjh1HPe7hnQ7c3wxsu0za0q-cdBs
Message-ID: <CA+5PVA7Pc8v3DcO9JQ9URjtx_5FZPmk_wp=pu+Ke8n7HUY4JmQ@mail.gmail.com>
Subject: Re: [PULL]: Update xbl_config firmware file for QDU100
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 7:55=E2=80=AFAM Kishore Batta
<kishore.batta@oss.qualcomm.com> wrote:
>
> The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e=
00:
>
>    Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/kishorebatta-ossqcom/linux-firmware.git
> update_xbl_config

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/638

josh

>
> for you to fetch changes up to 9188b156478e5d4a3fa455d9e0b588b4859c4a26:
>
>    qcom: Update xbl_config firmware file. (2025-08-07 17:16:52 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>        qcom: Update xbl_config firmware file.
>
>   qcom/qdu100/xbl_config.elf | Bin 225368 -> 225368 bytes
>
