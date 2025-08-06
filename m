Return-Path: <SRS0=Xmdo=2S=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D8CC87FCB
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Aug 2025 18:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18385C4CEED; Wed,  6 Aug 2025 18:28:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13275C4CEE7
	for <linux-firmware@kernel.org>; Wed,  6 Aug 2025 18:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13275C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CPYt2031608
	for <linux-firmware@kernel.org>; Wed, 6 Aug 2025 18:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adLUoam2/1dhbjjElG/UnH2/Tbu+pfcEJnCrslXVl6k=; b=T3Vdf5ifx84jVbuG
	c5jrwed4q5nFyNoSGeMUFAccUBR45BIjufpAVPj4EWNjWsevKc34g2wAfthxnZNU
	IrzO41y7N12P0kzcZo+xLsHvyDu0P9nJ8xKgRGHBqetUYpUi9MFNgOXBlru467d6
	otEGB95Klgit8gD9MDigV2pjbS+8DhZpXQ947UdzclvK8AJd7v4wowzgCr1Peugp
	bim/NnD9qG3uODu9eOccfClYsq0uLpilrhPsVnXDkSiRUMFdpQLljOxOIc/RRzk8
	kMHY/qjelBVbCXgNGScZZFQpVseCzFBHrYaEUR8b3VND4JbtbUhHnlTFpTGoWBnE
	GlKJ1w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybbrqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 18:28:22 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-61996c91264so31091eaf.2
        for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 11:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754504902; x=1755109702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adLUoam2/1dhbjjElG/UnH2/Tbu+pfcEJnCrslXVl6k=;
        b=Vjc8sOsjNKZxMhOMcJiqYGBH37zRIP4O6gbUxTWtZHBPer2BR9kpOBloqPiTuywj5L
         rudWd0ga7AAsbkOlCCIhYq36W/tewXg+Qry5SLvVE7WpYGfDFdrLrLbcrXsZHvhOizEG
         /np1yWPBNVa3WXpAM2/kK4Ioqvk7NqUdCvZShh/baZhQz6/sMBQrkWFcEloAN+ZtJdoC
         RA+7vDZ9JTBmKoPwvfCsijXopuGzgbGya3teEaA+pgUnfZ2sPNJcmfopEPbxL6uHiHNp
         hgam0HIVwPJZvqi3OtW9kgX1AaocPXCHXNr8BZ6lMuU12q9qwbYQi/6O2Qo6ZmPoCTps
         XSQA==
X-Gm-Message-State: AOJu0YyQuECSW1hx1YEM0ibaa3KTew6OFR1oddyhoRgVv+N5zZ2CItIG
	cqsG0N7M5d+lgEc0S9vEdFdhGktsq47aqvV4d8j/kpPwuMa9tWivuwFbst2NIOkJLKGIXw6uPFU
	KlPmhTQuUqRAmjeOrmwUwXWD8VnAuHCodw0iKWY5rr5zLZG+dBPcVuL0PAOmi2d3+iBHNPaT5My
	/6VdMVor+MSz07jgFFqPAC+zzAjUxUiJ0gm2ErxQ==
X-Gm-Gg: ASbGncu6iPrTlYPC5HrrecR9FVY30Asr0cIT6kl7V69qOYrrDg9wzdKJFMg5xbFK67O
	YISvvRisDpKzvXL/1BkA00caQ3/aB0NRxXwPc/bK99c35QdfsbMrAKDo2RsVcRcKX8czkapImXR
	vlv6mtSxDj1xSmKTPBVL7/9w==
X-Received: by 2002:a4a:e915:0:b0:619:9530:87e3 with SMTP id 006d021491bc7-61b5f2c8a08mr3256776eaf.1.1754504901878;
        Wed, 06 Aug 2025 11:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoRLFEYdw6tO4ATEE1voyGVEDEtsC9faCm5430ui2socwns3DX2o2UeUIWyfbVGi1bmk6hSgOflBcFKTPSe3c=
X-Received: by 2002:a4a:e915:0:b0:619:9530:87e3 with SMTP id
 006d021491bc7-61b5f2c8a08mr3256748eaf.1.1754504901433; Wed, 06 Aug 2025
 11:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHhZYkO=0C3b4LLTUKFyFgYeZcek-hL4NJ3ZH3-dUQ1xjQ@mail.gmail.com>
 <CAO9ioeWWoRrjgRQt9uUbbjPY4QZp47ufXeSHQp6K2eB1qjqngw@mail.gmail.com>
In-Reply-To: <CAO9ioeWWoRrjgRQt9uUbbjPY4QZp47ufXeSHQp6K2eB1qjqngw@mail.gmail.com>
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 23:58:10 +0530
X-Gm-Features: Ac12FXyzohgUjhpzt7b1z6ZVImpE5npcIFUpqtQMpUPzuJjd5Qz9mHz_ZFZ5_Pw
Message-ID: <CAPiVHHiLRQD9=e0YhQsxBvk0JeQTQRf1zHka520urYsSbUMoxw@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX2f/ewCjBxaJV
 JEqH7WfhkE9a6ujdmhh0rHlc1aDRLYvr726lLO3CJz2HQzwQDzomTIi2Ko3pyGu8WB0+n7gBSO2
 N0jChX7hFG20yWdF8TemEdZRn1/Ez3uh/VLXI6f+8R5hYPVnK6ai/j3Zz6i2RXEI0qYLvUPHkGd
 hnZNRtmvG8jI88YEUl6GZCvSYn24lgpELC5fSZxxiOZGpEPjQ/PrVcIn1+KwdVU9E4TasjP/p8I
 YIJ3qBiASQGLJ8dXx0nhD6MRwniZsJCSxGTG8Ozs/A1xKantjEUsVYMY7Oqeg2r4huxgI8ekkZb
 ISKuIoGSeH8gx3JE538MYQujQ7M0mR4hETEJ1LYKlQyQ3DVXsxNQIKNkgV0ScnwebcKxdWc2hYK
 oC3femAO
X-Proofpoint-GUID: M9f06ok49FGn_5DJj9QdgMFfJiE58UTP
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68939ec6 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=lkZqjbg1h1EXiO0b87QA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: M9f06ok49FGn_5DJj9QdgMFfJiE58UTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 6, 2025 at 11:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, 6 Aug 2025 at 23:21, Janaki Ramaiah Thota
> <janaki.thota@oss.qualcomm.com> wrote:
> >
> > Hi linux-firmware maintainers,
> >
> >  Here's a pull request for bluetooth firmware. Please let me know if
> >  you have any problems.
>
> Please also update version in the WHENCE file.
>

Hi Dimitry, Thanks for the quick review!
updated the pull request with suggested change as below

The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e00=
:

  Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)

are available in the Git repository at:

  https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD

for you to fetch changes up to 2ac901176d6df149cb0f9e0a8cd36627746a55b7:

  qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
(2025-08-06 23:47:20 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091

> >
> > The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be2=
8e00:
> >
> >   Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD
> >
> > for you to fetch changes up to d7925ab31e9406a0416bec96d2d1e6b25aba6bc7=
:
> >
> >   qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091 (20=
25-08-06 20:35:08 +0530)
> >
> > ----------------------------------------------------------------
> > Janaki Ramaiah Thota (1):
> >       qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
> >
> > Thanks,
> >  Janakiram
> >
>
>
> --
> With best wishes
> Dmitry

Thanks,
Janakiram
