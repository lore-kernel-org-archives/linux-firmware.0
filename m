Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3416BC5475B
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Mar 2024 19:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09942C43399; Fri,  1 Mar 2024 19:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7368C43394
	for <linux-firmware@kernel.org>; Fri,  1 Mar 2024 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709320666;
	bh=z8GzlGh9ZU3scyW1999m+nlQLRu24T7h7/0sJzusX7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gjEH0nCDQbZjfXgb5d6GtM4L8kAQMiWT7yL177tBj4EJfO63fltb9rZwSZAVGY17P
	 oEvfjQfimyZ3KX2/6a/2U4vUYvm+WWTk5hFcVZTTG561xv4AKZpVZx1sSwjBaLx6A/
	 /+4WU9Ug87gc2Er7rsFTzflHZgyrr9R0J3OFm1oEYWneIPDcYIosIWMMij6U4wkUaC
	 uvpPanF8gFbG4V+OntNrD7+j2YXXek6mAkvfeznvM/0dfwXrpzXd6xcyOiM9PiFscr
	 mjcVMAgS9cEM9d72nWe7Bb5Edbk4q1ObeAruyaL/BLx983XLBKeJDdgdqHynKxgmfd
	 /q8rLe1/3C1Pg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60982a6d8a7so12109057b3.0
        for <linux-firmware@kernel.org>; Fri, 01 Mar 2024 11:17:46 -0800 (PST)
X-Gm-Message-State: AOJu0YzyYfIjqYtU6r8579NwVejW0DZJundF6M1pEHBythxICNTkn7yf
	VSA6tGn1vIZGfPFMe2gtTnos23Hbmc5snCl2d5tCMjNy+7Avhharek3grhKeKFKG8auFcVNs93Z
	5FQAsJJ+tr1qAhbXMtTR6rn1oEaI=
X-Google-Smtp-Source: AGHT+IFUwXFjd3NtIaZDxX9n9Z0aDNYK+U8cv092hikxkH4IkB5PKJt66APWw5HYXrDeLyJ9KzJ5JNYkWyFQyj9I2cM=
X-Received: by 2002:a25:660e:0:b0:dc6:9b89:3f75 with SMTP id
 a14-20020a25660e000000b00dc69b893f75mr2302508ybc.40.1709320665360; Fri, 01
 Mar 2024 11:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20240222195634.291662-1-gustavo.sousa@intel.com>
In-Reply-To: <20240222195634.291662-1-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Mar 2024 14:17:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5a1hwas6CYVsL0h+7e-GXDSO0B2=fTuy3GWQXWky8MnQ@mail.gmail.com>
Message-ID: <CA+5PVA5a1hwas6CYVsL0h+7e-GXDSO0B2=fTuy3GWQXWky8MnQ@mail.gmail.com>
Subject: Re: PR for Xe2LPD DMC v2.18
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:56=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit 78b99e9ebad8e4e24dded99842f94a8a7db3a5=
e8:
>
>   Merge branch 'robot/pr-0-1708610465' into 'main' (2024-02-22 14:24:47 +=
0000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware xe2lpd_dmc_2.18

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/160

josh

>
> for you to fetch changes up to 94d9a511a605cc0794bbe2d13328143e86df26e9:
>
>   i915: Add Xe2LPD DMC v2.18 (2024-02-22 16:54:31 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Add Xe2LPD DMC v2.18
>
>  WHENCE              |   3 +++
>  i915/xe2lpd_dmc.bin | Bin 0 -> 61208 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/xe2lpd_dmc.bin
