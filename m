Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F33D41C06
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 12:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 871CFC4CED7; Wed, 13 Nov 2024 12:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA72C4CECF
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731500232;
	bh=+SljR+0GR0meKff3bEjJA6oKuBXY4GWhKFSXJ011FvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EkxW8dZyOfJOnzjT/eKLIYoyl+ypiOCaqBGDONeApgbccYOFjvdBybbvfXSrOvsZS
	 fWulUp3LsNqzpmB5qeQY97knv7ow/otWW98g4kjl1qimfoJHdKHRDWRUMR2bqWf1KI
	 e1NtiMYnPNMWyL0DYj1ePPbI6D0dpp9uach0c1Wgi4r8Wf9W3S7tB5AHiVxvvQqxuP
	 h0azTZ6G7nNWiAz25OteA76VeVKzZSEx7Df3hvIToPefYm37JDajHb8ub0Ve2xed7v
	 leqq0I2+GM1QKr4hEig0flx8g+Leywh3okkHZGqDvkpqSd0ElIXZCI95eHaOOVhVYS
	 G2F9r8CH6+cLg==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e292926104bso6117872276.0
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:17:12 -0800 (PST)
X-Gm-Message-State: AOJu0YxxK2owkNIc7KHI3QWd66+5cl+620xch9exUAyfw29OYsjFSFz3
	rg+ZFXgYdfk5H869Js3BLtWLXeIoc+fM5c4GnuoyDEHwbJedlXRU2FYBHl1eDFoklzU0t9F0dmk
	Ss/zMVT82I6PAjw4DaJGkM6IEP+A=
X-Google-Smtp-Source: AGHT+IFHk2RuIgUTGibxKYijKm5pvL7pUEvt1gEMOmAirQpu2+VdPbaioZmOJWj515qN3RJ0HGbFQKg4rLPCJFLDFFM=
X-Received: by 2002:a05:690c:c92:b0:6ea:c741:7388 with SMTP id
 00721157ae682-6eaddfd66famr215068197b3.39.1731500231633; Wed, 13 Nov 2024
 04:17:11 -0800 (PST)
MIME-Version: 1.0
References: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
In-Reply-To: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Nov 2024 07:17:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA70RYKd_1rJbA9OLS34+3s+Xau7Z+sSG65Q=toTy16w5A@mail.gmail.com>
Message-ID: <CA+5PVA70RYKd_1rJbA9OLS34+3s+Xau7Z+sSG65Q=toTy16w5A@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add 22 bluetooth firmware nvm files for QCA2066
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 10:52=E2=80=AFPM quic_zijuhu <quic_zijuhu@quicinc.c=
om> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3=
fe:
>
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/369

josh

>
> for you to fetch changes up to 77a11ffc5a0aaaadc870793d02f6c6781ee9f598:
>
>   QCA: Add 22 bluetooth firmware nvm files for QCA2066 (2024-11-13
> 11:36:07 +0800)
>
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Add 22 bluetooth firmware nvm files for QCA2066
>
