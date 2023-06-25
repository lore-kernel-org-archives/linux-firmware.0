Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238ADEB64DC
	for <linux-firmware@archiver.kernel.org>; Sun, 25 Jun 2023 16:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6A00C433C8; Sun, 25 Jun 2023 16:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D08EC433C9
	for <linux-firmware@kernel.org>; Sun, 25 Jun 2023 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687710017;
	bh=i+QDw5P5J228zYi9+YKDdnZhu0FRRmbxi2+iUozhL6w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EAvWdlfWqKUnrdLL6PlzDUxmlSEXRUWLbi5TDpX2jSKXFdcnd1qX7iCiC68krM5tU
	 ZrTA5whgGePu9ja45tj/iWzGOSdcTu0ABpzPYL4lFZEfO7IToUoOvtoRjLdKu7+3Nv
	 EBeMCzO2k6zf8DlyqGg/tcKXioe5Ps3Q+UVJuxD9H6bMIkKjG9CngSp0lRdx5/Mmin
	 Csguza2WSqDeoSqE2i+C1QFmdbi/KKyynegVO/JMkV4Z9PPRsPh4Q4qhq0AT3p7GM6
	 QuGD7od0lRA0pfyid0G2a+Y0EwCQSEMDiuAr7nLKkOMgiuydFAMC2kGcadTNn87u27
	 JB+dFQgTz3o9g==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5707b429540so38211337b3.1
        for <linux-firmware@kernel.org>; Sun, 25 Jun 2023 09:20:17 -0700 (PDT)
X-Gm-Message-State: AC+VfDzTiRv5qqk32/tg7On7OBcLf/XvjGxj44jLvS/1nLpezXHLZMyO
	idosfyqEKx1MRWEgMYYiZcKBnjo3sdA9Mlkz/kI=
X-Google-Smtp-Source: ACHHUZ7UPgnaEYjf7zV1gs7OqmTUimyMBIx49f/7dt4RZdnVuWUrh6ghqRgYfaxfPPDgFhj3uHz2rFVugZHBnu8IboU=
X-Received: by 2002:a81:8341:0:b0:56c:e371:aad with SMTP id
 t62-20020a818341000000b0056ce3710aadmr31184218ywf.14.1687710016564; Sun, 25
 Jun 2023 09:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230605141343.880621-2-emil.l.velikov@gmail.com> <CACvgo53fiiG52=khyqE+X=kkxRoQ28JUN4E+vYt3SCU_MNQNKg@mail.gmail.com>
In-Reply-To: <CACvgo53fiiG52=khyqE+X=kkxRoQ28JUN4E+vYt3SCU_MNQNKg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 25 Jun 2023 12:20:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6EEBtY2BisMhsDL8BkHqB1CUL18Y+8uyb-cH9TTS_w6Q@mail.gmail.com>
Message-ID: <CA+5PVA6EEBtY2BisMhsDL8BkHqB1CUL18Y+8uyb-cH9TTS_w6Q@mail.gmail.com>
Subject: Re: Misc fixes, sanity checks and xz/zstd compression
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 10:25=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail=
.com> wrote:
>
> On Mon, 5 Jun 2023 at 15:14, Emil Velikov <emil.l.velikov@gmail.com> wrot=
e:
> >
> > Hello Josh, everyone,
> >
> > Here is the third, and hopefully final, revision of this patch series. =
In a gist
> > we have:
> >  - extends the existing check_whence checks
> >  - fixes a bunch of glaring issues with copy-firmware - props to shellc=
heck
> >  - adds xz/zstd firmware compression support
> >
> > Note: despite being sent as a single piece, all the patches (apart from=
 the last
> > one) can be picked independently.
> >
> > With v2 we have:
> >  - dropped already applied patches
> >  - dropped copy-firmware.sh changes, as requested by Josh
> >  - couple of extra fixes
> >    - copy-firmware - drop backticks && quote - code used to be removed =
with v2
> >    - strip quotation marks in check_whence - quoted filenames are here =
to stay
> >
> > Josh, sorry for the delay with this respin. Hope all your concerns have=
 been
> > addressed, alternatively let me know and I'll send v4.
> >
> > Thanks
> > Emil
> >
> > Link to v1:
> > https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGWOP-Pb8oGo1=
BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/
> >
> > Link to v2:
> > https://lore.kernel.org/linux-firmware/CACvgo52CK-sJjx26tEz=3Dec2PqqFz0=
bWuUMgUNjtZEjGm8f7mig@mail.gmail.com/T/
> >
>
> Josh, others, humble ping?

Thanks for the respin, it's much appreciated.  I've applied all 8
patches, with a minor change to 8/8 to remove an errata verbose=3Decho
statement in the zstd case.

The timings for this are interesting.  These are from a decently
spec'd machine with NVME storage.

josh

[jwboyer@vader linux-firmware]$ time make
FIRMWAREDIR=3D/home/jwboyer/tmp/firmware install
install -d /home/jwboyer/tmp/firmware
./copy-firmware.sh /home/jwboyer/tmp/firmware

real 0m5.107s
user 0m2.846s
sys 0m2.370s
[jwboyer@vader linux-firmware]$ time make
FIRMWAREDIR=3D/home/jwboyer/tmp/firmware-zstd install-zst
install -d /home/jwboyer/tmp/firmware-zstd
./copy-firmware.sh --zstd /home/jwboyer/tmp/firmware-zstd

real 0m9.979s
user 0m6.567s
sys 0m3.605s

[jwboyer@vader linux-firmware]$ time make
FIRMWAREDIR=3D/home/jwboyer/tmp/firmware-xz install-xz
install -d /home/jwboyer/tmp/firmware-xz
./copy-firmware.sh --xz /home/jwboyer/tmp/firmware-xz

real 2m46.450s
user 2m30.488s
sys 0m15.617s
