Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA25EC46CA1
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Sep 2023 11:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75F41C433CB; Mon, 18 Sep 2023 11:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E56BC433C9;
	Mon, 18 Sep 2023 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695036999;
	bh=Gn7JKWmRc5B7Muypb+/Lz90MGn2wS3rqLP+IucfNG3c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=g2geKuOMTBabqJv+QwDhEPzNdF8o7LWTq6Ayxm3+pP70F580+fXEinra2jd7bFxSa
	 Za6twjbmPa3KKzR8YtE9I5AzMfXeHfsBe02GxSJtjr51PFfAuts9SG7zX4taHcmJhl
	 QzQFLehjm71T5qdj6zQqYVq/M5i/7G/xveTJtRCkILSLEcZgIG1k7Le+79qzygkX2d
	 pwrzcqpD7n1r2K/MXP/3rNcRgfKBjyzJYNIYKeCrOUz7g+6xSQqD2GS62NwUDT6W8g
	 AOMoXm/mRWD3RZ0qUh74w3mFLDOa04K068RmMUAumkNPT5RKfK9HExIwOlw3YITWy1
	 PwqyN0M7RrejA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58dce1f42d6so74525107b3.0;
        Mon, 18 Sep 2023 04:36:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2ohNkUCKkJBn/N70mXM3RzaVHGxSsdublifL/aD5ndvK1hL3v
	oYwETP2IK1l8PB2ES78901ldAWuZooWmvdC9BYw=
X-Google-Smtp-Source: AGHT+IHP4a7yKSxUlZEvWZ+RK7RUIizZOg38zVGZRX9LhZBup1jLWEXITWS/W2r+ug87KGhnHTXDwRfrELacXq2dj4s=
X-Received: by 2002:a25:2d0f:0:b0:d71:8786:625d with SMTP id
 t15-20020a252d0f000000b00d718786625dmr14135552ybt.1.1695036998516; Mon, 18
 Sep 2023 04:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230914154225.2821571-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230914154225.2821571-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 18 Sep 2023 07:36:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7SK9N+KbiaZbswYXi52P10RvXZ9ucwjsfcCbww-ComHw@mail.gmail.com>
Message-ID: <CA+5PVA7SK9N+KbiaZbswYXi52P10RvXZ9ucwjsfcCbww-ComHw@mail.gmail.com>
Subject: Re: PR for HuC v8.5.4 for MTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 11:49=E2=80=AFAM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit dfa11466cf000120d1551146fd5bf78c44941e=
da:
>
>   Merge branch 'main' into 'main' (2023-09-07 11:36:57 +0000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_huc_8.5.4

Pulled and pushed out.

josh

>
> for you to fetch changes up to a5dbe400f776b0dc2d0a402ba76b4c16c231b38e:
>
>   i915: update MTL HuC to version 8.5.4 (2023-09-14 08:34:08 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: update MTL HuC to version 8.5.4
>
>  WHENCE               |   2 +-
>  i915/mtl_huc_gsc.bin | Bin 569344 -> 561152 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
