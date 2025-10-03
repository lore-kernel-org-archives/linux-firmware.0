Return-Path: <SRS0=gdgd=4M=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E37CCA471
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDFACC4CEF7; Fri,  3 Oct 2025 14:22:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBA5BC4CEF5
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 14:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBA5BC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Bt6Wx023847
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uIAxySLvXXIoIXyO96LicJlw
	4Dpmr0S5zU3+bHosc1k=; b=XRRtZzwd0T/MMARTujjxR18ayAWCyIU7LsnYzBuK
	zV8sssEa47o42+d3OYMTGU94thr3Fau06bxyf6TZstsKm4lytuEQLL6CC8FgKTpP
	bbqSdI9dSijL8X33DB4/Qlw8dZccrSPcWNB6C0wTGce9KzEhDt2A8/DGxRg7IulE
	3TMao0j9sCEb3unX36kboDzcOrATRd1ZYkotJGpenvPy59a0mehfk3I/DDOeUoxR
	tdd/HfuNY7j6xTk3VRCN6rINeWGwvyfiaP3oK0wPGm3XLNzzLxPlBANaWKUos0XS
	58wEU6A9U5JomRoZFM+R0XWtqJ49cGFYCiQGcTEb+fh4tw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6b202-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 14:22:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso1810027a12.1
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 07:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759501373; x=1760106173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIAxySLvXXIoIXyO96LicJlw4Dpmr0S5zU3+bHosc1k=;
        b=EUURMLbnaTLvA7FwpVAdD1cDfKo4BnKFOjiFGDHaDPVXxGmlk0SA3upvXtY6Y29RWJ
         Uycd69mYsS5iSUQaQ6oa/XPNs2UJZl0hFwDLLhGjp0NTx+VP6so/Tb43q78OBCGDqICi
         ZpZ1JNaqy4jbAkrycZLgo3RvQPeeggFVQlJdMoCeXSe2DbGHj96DkIGEegVE7udDlvNh
         nu5NKf+kNkfshbbL6bOXUCKyb5Qd8tYdiThHqAkaji3kzDhKLTtQY8LjOaCFYRLXQyVO
         5Ai6wPfj/f5OpJMcZgLycHvkgL0bc+aCvM3deZd2qrHwCOvP0517vbuFE8IkA+j0XZy2
         Rdzw==
X-Gm-Message-State: AOJu0Yw4Ded2YrgfyPsnWODRXillGKUYEOJjAynDG2eABvS+zjPPNOWs
	uUfbE93OmZkdguC2LPcUQUkJ79cWgRa/eGKlkEMstnU/INV3b5dlP9P+JKmI2f1HGQksu8jaNix
	v7lV+sOq6KizleF+mzjbXjERSJJoPC3/aBBj1yQ/XbAT9iH4yRLgS3mGqapeciXZXi+KBESsA6B
	rGcEO3BeuAYQ6jKKsc6fmRcxqAx0pmmiyCQXrZNA==
X-Gm-Gg: ASbGnctyGnV0miIpoM6ccqcTWcLIv/W/ESL/UZh39xCLDvMKsxW5yyFFjtPO58yZvEb
	DZWHnS6HZ71/nsBd2MM3Y9EdTUTAMOSKXIMW6xL+u3AX5jlj4uaTlpPIzhZfaAIGCnlJjoinFMb
	v+TO3Gz1U2EnxBI22+/zznv2U0h/Q=
X-Received: by 2002:a17:903:244c:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-28e9a619891mr37709155ad.29.1759501373092;
        Fri, 03 Oct 2025 07:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBzOSychShLvzBniOTYPzUpTL1rACfnTo14mlZA+aKprey9CpzCUZVrUkO3Jr1eO+NXMyeQr8Z/+lZ/FT7XQc=
X-Received: by 2002:a17:903:244c:b0:269:82a5:f9e9 with SMTP id
 d9443c01a7336-28e9a619891mr37708755ad.29.1759501372500; Fri, 03 Oct 2025
 07:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
 <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa> <0c9f7619-acf1-3927-0caa-00ce9f696129@oss.qualcomm.com>
In-Reply-To: <0c9f7619-acf1-3927-0caa-00ce9f696129@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 17:22:43 +0300
X-Gm-Features: AS18NWBLMRwuPEl-YGWFzBsC3LTrqyiJb4rCPrchGsMLNBlEb8zuG_-EGt0SwUA
Message-ID: <CAO9ioeVgWoGy6YhdDvSR1_Ri2HnqD4gToJZ4eKm_vs1Z7EEexQ@mail.gmail.com>
Subject: Re: add video firmware for Kaanapali
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dfdc3e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=gkc9JvbE4Gr5N0IH8rwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: OIKtpI4_Hg2iwl6gDqR3TeQOioJkpmNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzCjF+q/2VuWp
 4N4XfnCDuhytRFvXJmihTkUM84d+FngKNV7QNx3ivS/x2MhLxBgZf1+JuBBGDgEtTbPByLjab3q
 Sg6ptVMKCpnWM9H9H2P1F1zrdP0SJZFG8R65UPziXri2MJurtwRmzjkGr43gGARnibDZdyEn857
 XwC43jIZJ+FFUidSEHUhUfG4mK4dTgrLDcX77zHuyR7Ike07DRClTJ7ho6t6oVi7rNBbotYZRVw
 GgxwmDwVTtIWds7l2bWQkT6qLr0AFb3j8d3zJbFLIlmG7+JRGntuex3lKJclztaKSQu2O8sGuAJ
 egXJ07u/kThth+nT1vIU3BS2coWIXbDtt7fKk6PP8kzEaEofzXGEQTgGSyITj0s09D4G35tBnhh
 8HYcdz3P9NXFmdS+YLS8hYZY28MRQg==
X-Proofpoint-ORIG-GUID: OIKtpI4_Hg2iwl6gDqR3TeQOioJkpmNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Fri, 3 Oct 2025 at 09:55, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 10/2/2025 6:18 AM, Dmitry Baryshkov wrote:
> > On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
> >> Hi,
> >>
> >> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
> >>
> >>   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-kaanapali
> >>
> >> for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
> >>
> >>   qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)
> >
> > +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
> >
> > Can we please drop that link? FWIW the driver for that platform is not
> > yet merged.
>
> My intention was to keep the naming consistent in driver with other
> platforms which are using _s7 firmwares but driver still won't have this
> suffix.
>
> eg: when I upload the patch to rename let's kailua firmware binary name
> with adding _s7 suffix, driver would still have the name without the suffix
> and soft link will take care of mapping
>
> Any concern here?

There is a difference between having backwards-compatibility links
(yes, we carry them for a long) and just adding a symlink for a new
firmware that didn't exist beforehand. Extra symlinks add extra noise
for no particular reason.

>
> Thanks,
> Dikshita
> >
> >>
> >> ----------------------------------------------------------------
> >> Dikshita Agarwal (1):
> >>       qcom: vpu: add video firmware for Kaanapali
> >>
> >>  WHENCE                   |   5 +++++
> >>  qcom/vpu/vpu40_p2_s7.mbn | Bin 0 -> 2474696 bytes
> >>  2 files changed, 5 insertions(+)
> >>  create mode 100644 qcom/vpu/vpu40_p2_s7.mbn
> >>
> >> Thanks,
> >> Dikshita
> >



-- 
With best wishes
Dmitry
