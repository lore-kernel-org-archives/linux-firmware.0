Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D00C0218B
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Jan 2025 14:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9677C4CEE1; Thu, 23 Jan 2025 14:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4035C4CEE2
	for <linux-firmware@kernel.org>; Thu, 23 Jan 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737643626;
	bh=whd9w4x/Kcpn8PZftUVZ/Y1yg8xlZuvQugQFVIcixhc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M4O8EP1pJFRhl7AkMKs/PEFJshbQWN8UMQRGM/bUENhEncYyGyEEKMJ+nJfW/ree7
	 xkLQwi8COGm8DNmV+ABDcZ9BFhrfH1ZEaPNjXo5VaqV7tVXNBb/kNGn5K9rVrcAZ8a
	 fDcq1zMlrYxotydgxoaegIe9qKPF4GvT7aajrh3PkQS8FjwSyY1Y+znNSFAkEVuT8y
	 CqNtnihYSP/v9Pt8gZyQKvY0anBY2PEr74QUOK3Pob+6yDojz5Xm1ipjphiFfL7go9
	 PwI/UUepyUmQkQUaTokEx1cUoSo1U9cz2J7StyPpYxC2OPlG2+OT94LvVo+PJALawN
	 tnuAwOniN2WCg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso1836071276.1
        for <linux-firmware@kernel.org>; Thu, 23 Jan 2025 06:47:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPWIwRi7LJwV2Yr+96Oj6CpUZZIug/q9XvsioJQJCR3tXsrp3PDlP7+tIBdwNpYHb7sfAZVSmxM9DVfuePZw==@kernel.org
X-Gm-Message-State: AOJu0Yx3IPxVo4wxL6THW0b5cnzpvgcQ6E/HSc+bx/eOy4wtNd3jDKvi
	bHLhARpekIPYdxY3rcB2P3+4iWoj8h670v5MOUv5C0SyfqQ3W7xyCL74N44weuNF/x/1fN9+3ue
	QBaTErsMTpdrbvAMofxqWojVLc3o=
X-Google-Smtp-Source: AGHT+IH+TygIWhCdk1TwC7x6EJSO2FLCu/TeT3n/jpOHynjysXZXBhRunvrmwP0RwJgJaDYbadBIERtDpMSJ9TlLI7o=
X-Received: by 2002:a05:6902:12cb:b0:e57:2391:a460 with SMTP id
 3f1490d57ef6-e57b1054157mr20990383276.20.1737643625942; Thu, 23 Jan 2025
 06:47:05 -0800 (PST)
MIME-Version: 1.0
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
 <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com> <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
 <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com> <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
 <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com> <375wp6vzjho3eu3guzjxajixvmumop5e3m6aqhgpgrqkxr4lhx@tsoarhsqmcan>
 <0434d052-83f2-40f6-8e10-d6171458dd03@quicinc.com> <louhigsmkfff7jsfunwwev4iibz4yxmbfobicwdf2n5fymtx6u@vmxrlt5ddwzy>
In-Reply-To: <louhigsmkfff7jsfunwwev4iibz4yxmbfobicwdf2n5fymtx6u@vmxrlt5ddwzy>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 23 Jan 2025 09:46:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7kZqxyM8t+XwO=ZcdNh1kZOd9XA4GGu-FcrirTM=w0hg@mail.gmail.com>
X-Gm-Features: AbW1kvboBGjRHibicHw9gBt35AczBLT9QnAF7AM4KA0hxbBWyLnOGTOQV1CmaVs
Message-ID: <CA+5PVA7kZqxyM8t+XwO=ZcdNh1kZOd9XA4GGu-FcrirTM=w0hg@mail.gmail.com>
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Cheng Jiang <quic_chejiang@quicinc.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/421

josh

On Thu, Jan 23, 2025 at 2:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jan 23, 2025 at 08:22:30AM +0800, Cheng Jiang wrote:
> > Hi Dmitry,
> >
> > On 1/23/2025 2:50 AM, Dmitry Baryshkov wrote:
> > > On Wed, Jan 22, 2025 at 06:39:15PM +0800, Cheng Jiang wrote:
> > >> Hi Dmitry.
> > >>
> > >> On 1/22/2025 8:53 AM, Dmitry Baryshkov wrote:
> > >>> On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
> > >>>>
> > >>>>
> > >>>> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
> > >>>>> On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.=
com> wrote:
> > >>>>>>
> > >>>>>> Hi Dmitry,
> > >>>>>>
> > >>>>>> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> > >>>>>>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wro=
te:
> > >>>>>>>> Hi linux-firmware maintainers,
> > >>>>>>>>
> > >>>>>>>> Here's a pull request for btqca bluetooth firmware. Please let=
 me know if you have any problems.
> > >>>>>>>>
> > >>>>>>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970=
a4d967c1a1d92:
> > >>>>>>>>
> > >>>>>>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13=
 14:30:09 2025 +0000)
> > >>>>>>>>
> > >>>>>>>> are available in the git repository at:
> > >>>>>>>>
> > >>>>>>>>   https://github.com/che-jiang/qca_btfw
> > >>>>>>>>
> > >>>>>>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d=
73a6fa8cb:
> > >>>>>>>>
> > >>>>>>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47=
 2025 +0800)
> > >>>>>>>>
> > >>>>>>>> --------------------------------------------------------------=
--
> > >>>>>>>>  Cheng Jiang (1):
> > >>>>>>>>
> > >>>>>>>>     QCA: Add Bluetooth firmware for QCA6698
> > >>>>>>>>
> > >>>>>>>>     This commit will add required Bluetooth firmware files for=
 QCA6698
> > >>>>>>>>     The image version is 2.1.2-00035.
> > >>>>>>>
> > >>>>>>> Please confirm whether these files should be using LICENSE.qcom=
 or
> > >>>>>>> LICENSE.QualcommAtheros_ath10k?
> > >>>>>> Thank you for review this, it should be LICENSE.qcom.
> > >>>>>>>
> > >>>>>>> Also please include into the commit message an explanation that=
 was
> > >>>>>>> shared together with the kernel patches so that nobody is surpr=
ised by
> > >>>>>>> the subdir and the firmware names.
> > >>>>>> Ack.
> > >>>>>>>
> > >>>>>>>
> > >>>>>>>>
> > >>>>>>>>     hpbtfw21.tlv : RAM FW dump
> > >>>>>>>>     hpnv21.b206  : NVM dump
> > >>>>>>>>     hpnv21.b207  : NVM dump
> > >>>>>>>
> > >>>>>>> Which platforms are these two files for?
> > >>>>>> Currently there are two connectivity boards using QCA6698, the b=
oard id
> > >>>>>> are 206 and 207 respectively. So add two board specific nvm file=
s here.
> > >>>>>
> > >>>>> Connectivity boards for ... ?
> > >>>>>
> > >>>> Connectivity boards for sa8775p-ride platform. Here is the dts cha=
nges.
> > >>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/202501100=
63914.28001-2-quic_chejiang@quicinc.com/
> > >>>
> > >>> Commit message, please.
> > >>>
> > >> Ack.
> > >> Here is the new commit id a55049bb0691bc5c0f800a0a32ab0445f5de9b8e o=
n
> > >> https://github.com/che-jiang/qca_btfw
> > >> Could you please help to review? Thanks!
> > >
> > > I'd drop the DTS link. Looks good to me otherwise.
> > >
> > Thank you! I updated the commit message in 52e961830b8eb7c7c7c36adbaac3=
2fef71726251.
>
> LGTM
>
> > >>
> > >>>>
> > >>>> And the driver changes:
> > >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoot=
h-next.git/commit/?id=3D8c6fb157eb03
> > >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoot=
h-next.git/commit/?id=3Dad3f4635a796
> > >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoot=
h-next.git/commit/?id=3Dbe6ff38d6852
> > >>>>
> > >>>>
> > >>>>>>>
> > >>>>>>>>     hpnv21.bin   : NVM dump
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>
> > >>>>>
> > >>>>>
> > >>>>
> > >>>
> > >>
> > >
> >
>
> --
> With best wishes
> Dmitry
