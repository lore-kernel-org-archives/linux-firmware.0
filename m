Return-Path: <SRS0=QQPi=4A=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC6CAC59A
	for <linux-firmware@archiver.kernel.org>; Sun, 21 Sep 2025 04:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88E80C116B1; Sun, 21 Sep 2025 04:41:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BF8DC4CEF0
	for <linux-firmware@kernel.org>; Sun, 21 Sep 2025 04:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BF8DC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L2Lpj8014092
	for <linux-firmware@kernel.org>; Sun, 21 Sep 2025 04:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2D0EA4MCvNxGnNa/t/Vos+AxEhphVl7mRhFD39/tT50=; b=DzD58yWPhmCV6E8f
	ixPYbi8BVC4SQdEqzcCdMaOdz6W6QSJJPMjkuHskEkBEbXzdKUQOpQvdljgOpkdP
	0fg/zJSdKp5W2zlyrGtjfhZwY/Y4SHOgvdTuFhZieLVrQqxUY7DaPct1ft5sGt6i
	bHIISi9Hd/CwetRy9cRcYxUaOdgr8AJKgMAxuQomvX0JyD74+AIs4ciK0SsdjzCm
	JOa/G2XAL5F3CGTauCk2l778txgkEVFkdTDsrhsknOed51De4F9blepyTK0oxl8y
	FdWH3YuFsVDhuuJEZypi0qcM5geYtObzCN7xz1wlfhV47pKLDldRxA896JFt5DYF
	pUtzaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f9kbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 21 Sep 2025 04:41:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so68383311cf.2
        for <linux-firmware@kernel.org>; Sat, 20 Sep 2025 21:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758429687; x=1759034487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2D0EA4MCvNxGnNa/t/Vos+AxEhphVl7mRhFD39/tT50=;
        b=NtbqxjnhVwYmqy+bBW11sr9S75FmtFAQvFAQswXctt2/vtjX2rcjzbKCvg9mgT1Q5H
         +lORrMngkBXibuKxoqUigbuLKneZTGaTBYDGEY2NSgObdCqKrmO+8CMbrKrum0SPrxyO
         sa3kzjEcQmDtrvosYk66kND/7Dc4i59fEqzPtXi2OFo5S+KBL8VExgHkdejssZ0Tt9Ns
         ViwiS3yvF5NtPOi9DlATvc5DAIVDfWTDoznWfdV0ZKRmmB8jRK2sG5LOl394QdWqPFM4
         SNFASI7yQO0LjtFzoA/hSUQvx7vaWLVbSttwZ/3w6Thm+tQTPPBqQNasacADtpBckEfR
         ghgw==
X-Forwarded-Encrypted: i=1; AJvYcCUG2fwMzevsDrI61XVTR9baZGpD+ZlaGZYr34u3ReFbOG8SpkYP7RR6BjrKgETUQjuBHPyCSsfyAefYzc/k1A==@kernel.org
X-Gm-Message-State: AOJu0YzLtKSLFY9/JQuBZRfaRxR9gM96+Xr832IduXO6xGzZr1HVVc3Z
	jhAttdkFid1cf0XHzcSvtvgqlinsmOJyc54xu6mjvjgLkcc4/0tT3s4F9ePj5DXy4Ylke5sBcEm
	l+CngA4ho7KIz2cj0so5XFIMgfK4MQOZt3oT31RcPiTstkKqDVMHXtuP9pqnX0z0=
X-Gm-Gg: ASbGncuCLvaZjnRObYiceVVqvqD3md54ptmICuIgpQ+YMqx6fiVP5+tb75eB7EQ2fyd
	dvw9hwKi6qQsW27iCPThSQg7OwQdMqDOvEu/9xKRnS4h1siJ7JVPWWyrfZv3HXqgtxccappoC6q
	9DycdbsRT9E0Lx6MsMO8lolQk06M2UvfdF75rPeyw1M4Vg46qVNX85xlqHQJREjSWAqBQoQfuPi
	MibgszN0eMpYrG7Znzde+KqM0nqmWLfSCuKQaCiSTuWwgob32VzDfNYr0oU2Ao+CymIh1jv/PLZ
	t5T74YIXo99sBPOccG4bZmzzrUH/yT4DT24WAVgELYHPZh2dfXtyaeaYtxc5hp9dw1mcwqcoDBu
	B1QQXD+UnCTE8C21UmtYHFmDdBNZITkMmhmkws/nTDAFWWMyS9qA4
X-Received: by 2002:a05:622a:5807:b0:4b5:e2fe:31a0 with SMTP id d75a77b69052e-4c0718f65abmr117110621cf.43.1758429687001;
        Sat, 20 Sep 2025 21:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxFdxuH4XSwvgft5OIh0R+hstcxY2Odh4XImV4pJn6V0JwuHJ0yZ5B6TCxALkvxyaRQ33ZhA==
X-Received: by 2002:a05:622a:5807:b0:4b5:e2fe:31a0 with SMTP id d75a77b69052e-4c0718f65abmr117110431cf.43.1758429686536;
        Sat, 20 Sep 2025 21:41:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4472asm2342149e87.5.2025.09.20.21.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 21:41:25 -0700 (PDT)
Date: Sun, 21 Sep 2025 07:41:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-firmware@kernel.org
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
Message-ID: <7gnlc6wv5t2livvvkgob7qqyjswcr6bpo2fbg634hpr4o7d5hu@ixozfvql2mis>
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
 <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
 <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
 <15ad368e-0d36-41c7-a9be-71d08ba1efe2@oss.qualcomm.com>
 <CA+5PVA4o11_BisRiNYZhMoWR7Hyyrg7Qu6ZrxJLxraFoz2NThA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA4o11_BisRiNYZhMoWR7Hyyrg7Qu6ZrxJLxraFoz2NThA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: gbhhtEkFZYttF0Y6819Ek0QEi6e2xAwv
X-Proofpoint-GUID: gbhhtEkFZYttF0Y6819Ek0QEi6e2xAwv
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cf81f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=p0WdMEafAAAA:8 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=uH97MjM3jjqfulM6rS0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7B2DBIsfFDS2
 THBbAEBgosBFmUsIUiChrihhkZpVhbpESYesNt8trrmXTPlgbZw2+W7j/Rp9Ffo5JwZ3EXQp6KV
 psHTcP4kKW7Y99pSP5ZJykoePtgwK8yx0SKQRYOzdzcoA5//wazmTgFmCheonz4tqqeY6lvxrpp
 g52r1qWTsWVa/cVR1qYq7zob7xVuSFTqGwIGUaPaaB7uX1K3p9DduQ93ZBQGNWSZJse43KTEKgP
 CRGo/M5BXoS1DQpGHtimXHJSWsN5Ogr2ElFL1nc2VRDKvgwybe4rtQvezCrJ5by1xLDosQHNklK
 koGG1R48wPONeaqPQmOWDv1hb9SbrwcGgZnoMVEyjZPhJ9aC99QI6UjyiybBr2Dw43+S/yczalL
 BZSeRZzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Hello Akhil,

On Wed, Sep 03, 2025 at 11:25:22AM -0400, Josh Boyer wrote:
> On Wed, Sep 3, 2025 at 6:26 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > On 7/16/2025 5:01 AM, Josh Boyer wrote:
> > > Pulled and pushed out.
> > >
> > > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/613
> > >
> > > josh
> > >
> > > On Tue, Jul 15, 2025 at 8:16 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
> > >>> On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
> > >>>> On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
> > >>>>> Hi,
> > >>>>>
> > >>>>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
> > >>>>>
> > >>>>> -Akhil
> > >>>>>
> > >>>>> ---
> > >>>>> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
> > >>>>>
> > >>>>>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> > >>>>>
> > >>>>> are available in the Git repository at:
> > >>>>>
> > >>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
> > >>>>>
> > >>>>> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
> > >>>>>
> > >>>>>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
> > >>>>>
> > >>>>> ----------------------------------------------------------------
> > >>>>> Akhil P Oommen (1):
> > >>>>>       qcom: Update gpu firmwares of QCS615 chipset
> > >>>>>
> > >>>>>  WHENCE                   |   3 +++
> > >>>>>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
> > >>>>>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
> >
> > Hi Josh,
> >
> > The latest tip of 'main' branch doesn't show this file. File size
> > is 3KB instead of the expected 14KB. Any chance you might have
> > accidentally pulled in a wrong PR?
> 
> Perhaps.  I suggest sending a new PR with whatever fixes are required.

Any updates regarding the ZAP shader? Would you send the PR?

-- 
With best wishes
Dmitry
