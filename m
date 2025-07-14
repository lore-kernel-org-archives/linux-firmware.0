Return-Path: <SRS0=tToF=Z3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B7EC83F1B
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 15:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29CB8C4CEF0; Mon, 14 Jul 2025 15:11:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 354DBC4CEED
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 354DBC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9USug028415
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atjEbsI8zb2Rfjy2JmffueXYC9Tru6EcKLRhI+/uMtY=; b=iULrYz+Yu4BPagfu
	F9WsGTb6xx2LopBUFrVA/O+LnwPz6WppiQgeBiqaInx4D5p+LIUbF8BlS7VryAA2
	5rDXlcO7NvwrqaizfgwBIYSEQPtGG5vKm/Enh6QMsNLEGB/VrNB6Wkgbr5/TcuRH
	g+ZDt5BRDXtLaFwTex5KzhsY2GPtCgY/Tv8Vcb0w/8CBvrAp4nfk/Yn2LEkWFdyr
	M1rEqFcC2D9qOu9EEoxKMDi4QSVCPbuYuGonooYuglA49GESLvXtr9QqOfhrMiYq
	HiGd26SOIYeOpXdsE9tFcWbKpNmMwiLvJVWvKfqN+JTUqbrU/AYs6AbR4obzwN7u
	BeG1ZA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut4yhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:11:14 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3de3b5b7703so28425365ab.1
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 08:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505873; x=1753110673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atjEbsI8zb2Rfjy2JmffueXYC9Tru6EcKLRhI+/uMtY=;
        b=J15nO1abwI9ci9KfwVtJ+XI76O6bH7F7NLftNDr7kwMKEumvgHZHCkcqqRogydlCyC
         NSb0yIKInuMxGDHsmzu56vJEDEwVgQ7gsHIuLGZv3M1uNJEFYGsat0MZzJjriQNTvNlJ
         mUHGhMY1ztFjU1WyemyzCeffqlujn+Z+H5fDtrzRUGPrOcnw7NoKVMMJ86L3ZVtvOKxn
         oqyk6QLjmPT6mOw19HjdxtOd/HID9Seg2yrhgJTDHbmEI6fdBJRTL1mpj6ftSdLwnTQb
         XtRFhEa2EGHgz3+dFq0QvvQgPiBgr8B6HvB/GQcX7vhc7tvNlxVbfYVHnyDMum5UQ3Yz
         fMkw==
X-Forwarded-Encrypted: i=1; AJvYcCXTY1aqfwzj80B/oodxYawyrBuB82j0NuxlllZFJB8omXcn0uo2TOOVOpzg3SblZfAU0WnJ73L78BQCe2tnTg==@kernel.org
X-Gm-Message-State: AOJu0YyF4zCP0uTDfhigQYvXptkIKXPa30j3dwwA2gv5Is9wMG6Bhc4C
	PaRa5iN/F5aul8BQQhHhxe6FM71X5gRVMucA6fCngxL8hkDZZ2oVBWUB+bEFyXoveuo+eUisLnR
	XL72LHYB1LvvcdQOP6MjhbkPQcON7JLFynFUICwYBeFNKeL7UCms2l67NXUpXA6/e2uMwJm8=
X-Gm-Gg: ASbGnctQHBmLQU3eYI04B3KenuaeA5CPEpJg200ekVwuYRjrnxpR1yPU/rfQZf0V1ef
	GnxQKNqinjKdM+H0Egt1JhjTea4L7xvBbqy7M8YS81HSCQMyYP9F1fm/7i3e4hOphKMdNUc6Qmn
	V7YegScqi7li3VYXdV/UDx+lZ+v8IWSxFxVPE895mpIVwQ9ohoopAoHDc4oQe8FL9r55qY721t9
	LeZy9Q8rAZQUCZXTcrQQjEWmd5StnBPi0EgOzCL74r96mseBeMODQCeAlC3r8oyOvZD5YLEs/Ho
	BOYRXoQLBkrS1KEW13K4bIC+krNpHspnX7440Q8B8YJlScN7yMym824yr5WtFSv7xda6ZpWsd6K
	/YtaiyBEM+rV9evit0jIQXlzLGIFUlKNOGS1WhtZMuJmTKZCHZD0ALIJXatq3sZsJ4ThsrLFAK8
	zYtgEE4pgvuQ==
X-Received: by 2002:a05:6e02:260b:b0:3dc:7fa4:823 with SMTP id e9e14a558f8ab-3e254329030mr99875335ab.16.1752505873165;
        Mon, 14 Jul 2025 08:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXJuSUj3glt5DCXIq32V7DSC+wvuBvPGbNkrDQ+WMsJm7eccuY5BG5S2sILGMgAqhk21o9Ww==
X-Received: by 2002:a05:6e02:260b:b0:3dc:7fa4:823 with SMTP id e9e14a558f8ab-3e254329030mr99874825ab.16.1752505872578;
        Mon, 14 Jul 2025 08:11:12 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a9:993:8596:5880:705:6dca? (2001-14bb-a9-993-8596-5880-705-6dca.rev.dnainternet.fi. [2001:14bb:a9:993:8596:5880:705:6dca])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2930d6fsm16567831fa.31.2025.07.14.08.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:11:11 -0700 (PDT)
Message-ID: <a4b0a5d1-ec5a-4812-970c-018cf9c9f0a2@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 18:11:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset
List-Id: <linux-firmware.lore.kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-firmware@kernel.org
References: <10ee301c-7549-4a97-8e74-45329737222a@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <10ee301c-7549-4a97-8e74-45329737222a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68751e12 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=vKvkkM9pPH89fMe7kC8A:9 a=QEXdDO2ut3YA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: xT8zW5QkCYWwfBsnQkAnJbNN2Bwny_T9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MCBTYWx0ZWRfX4mEp6FdM3QSM
 Iz7jAuGAyHOGhw7RTzW2E0hDl1xpJ89Nn7XTdrITNc0lLYRV0rV9qYg+JaxVvTI1hU2NSHFWaXw
 Jj3PUqscmE4jAx1yYpq5064jbw47KwQtlqfM8R0czS28mckRRofg3SDhId33OHQRsiRfs62Xl32
 +UIXBUh5Vsx1XqkgFQhB356tgzeDxY396SoznHWxgeXFyGs58szEjfoZ9RdISFeDQVanCMCFBYb
 jJ458UU8OV6uGF4FU9UFlMVXQCG2i+yR5ocAWVaCol4LS/4/UrAsADxC0rrFsomfkcUjemZvQ/R
 ifgrw0DZUWLkH1hB+Wu/dOOzlwyRZnKitbChbdhrq6jeFWJ0corm32RoMUtVLd5eRarUtLHwB8h
 z/fKVo/7X6O2J3tPCHa1S2lUHv6rn+ckXuN1vykKaNuKfMlihUSid7x2G1Q2T3ndzM8x4aEu
X-Proofpoint-ORIG-GUID: xT8zW5QkCYWwfBsnQkAnJbNN2Bwny_T9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=968 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140090

On 14/07/2025 18:00, Akhil P Oommen wrote:
> Hi,
> 
> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
> 
> -Akhil
> 
> ---
> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
> 
>    Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v2
> 
> for you to fetch changes up to 9e60f646cafc202d2a3613be7ee277e1a84c1cec:
> 
>    qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 20:16:48 +0530)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>        qcom: Update gpu firmwares of QCS615 chipset
> 
>   WHENCE                   |   3 +++
>   qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes

I think the consensus was to skip RGMU for now.

>   qcom/qcs615/a612_zap.mbn | Bin 14256 -> 2977 bytes

This file is broken. It's an HTML instead of an ELF.

>   3 files changed, 3 insertions(+)
>   create mode 100644 qcom/a612_rgmu.bin


-- 
With best wishes
Dmitry
