Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466FFC0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CDBBC433CB; Mon, 24 Jul 2023 12:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A51C433C7
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201690;
	bh=81aobJ2Jb5TVo1kENg1+5Q1aPpnryCqqlBZPgye0oc4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qs2PC2ekYXgPooW8o8tpQoQwu2r0482/CBzPD83y7J6xzWqKx4Ex9bFcy23fqS2yA
	 XKa47jpcLxJPJV1/4N6samkoCu1IMEHwpSGrwdmV+uq09h2bh7xIOJUBOZCSlZc1S7
	 i2oj7t5+ZVFsK/O+qDLZLOv6XUjt4RpvTJJ+SOQGs2AEm+tICt6o1kxT0c9vOkC38a
	 PGmmTgpQzbEkAloG/zqmBJ6rxyvPvlXd86DGKzHYrKlBitQqGI3nxStsezhDGdP3V9
	 ebhlUhe3A72uy3FTvj21MpmvOZvy+dX1BWRi7G8ezXZiaNj6T6Q4++f1QNwn8zOqvF
	 TSa693YoyAUjw==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d0728058651so2668145276.1
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:28:09 -0700 (PDT)
X-Gm-Message-State: ABy/qLb5g3IWpeIvOoO7wBuhwluhTXfRz9VwYh6os/14Ncto19YYRioi
	dhX9C/5AWQB4mNC1Bo2sITayTXOPBgq9D4t6RV0=
X-Google-Smtp-Source: APBJJlECXYWWgCrLXpUQS1H1V8gJOfjkgeYz6WQQCjRjVf5hK0qfuGQHcfA7xrPqCIYr/HeA7i9wUoEtvfi5nVG0hts=
X-Received: by 2002:a25:234f:0:b0:d0f:559f:5565 with SMTP id
 j76-20020a25234f000000b00d0f559f5565mr2769078ybj.52.1690201689092; Mon, 24
 Jul 2023 05:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PHrRxbVSy1qt_L3sdTO0NTuVSOkYXALJe7JuVjExT8iQ@mail.gmail.com>
In-Reply-To: <CADnq5_PHrRxbVSy1qt_L3sdTO0NTuVSOkYXALJe7JuVjExT8iQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:27:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Ygq5=3K0AWo9GcVw6JJ6HO3d02MwwHSwpKZAL-bNvaw@mail.gmail.com>
Message-ID: <CA+5PVA7Ygq5=3K0AWo9GcVw6JJ6HO3d02MwwHSwpKZAL-bNvaw@mail.gmail.com>
Subject: Re: Updated amdgpu VCN firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, Jul 18, 2023 at 4:07=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> Updated amdgpu VCN firmware.  Please apply!
>
> Thanks,
>
> Alex
