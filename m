Return-Path: <SRS0=tToF=Z3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2729C83F1A
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 22:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5B64C4CEF6; Mon, 14 Jul 2025 22:24:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A88F0C4CEF4
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 22:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A88F0C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJ85Sf013407
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 22:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TxYrUdvM9kFMSG5klKW+wkJC
	Ap56gpoOXwT+XTCYDAw=; b=Y7OyFJF9IZAhT0wIlVXc1ByfK+6Z1F/G0xpaiWvU
	5ZozD4AMOUSUajaH1+OXqUVbfnYixOIBdu1rvBWFtQM4liu/F0Byr/ytGborKh8D
	VSAv1Im4ALElc5IET9zaLzNbshKLdWAxAziswqa2xqMmVWHaUrbcZKrWct8MhCJX
	EGImNhPRHDe+de18LNIIl6zKM9klJgytdXjVXjNcQB+pp0rqHMeGGoCK1g5F/GCB
	LJnIHjxz56DyeMpHew8n5DlIXT06z1tkyeZonzsCPlNo+hWwjxF6UwnHbJgzOUMs
	74DJZL10UEPcKd8OTk4SS8dIZqkpSwVoEnrgnFvZPRdc0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbe0tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 22:24:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so1011237085a.0
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752531849; x=1753136649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxYrUdvM9kFMSG5klKW+wkJCAp56gpoOXwT+XTCYDAw=;
        b=afvGOy/8ay+IV6sR9oeAx3FoTLr3LA40tHJx3HJdEUgQSEUlly+CDmXiGwF5ULHkQM
         omGwETV1bsY1uaH1BRTzctpdu4Qjfp640jCa7tgIwC9XUw7r4Yop6aXRX8ckk2U2eOjg
         pvnqdI2voarFNLfFZSSndML84yooZ17tdVCzqbGJ/gZ0EvHznLBKQ8M8ZDdEK+BdfY8F
         5kFynNLZKpi+1XmWDIhcpbSTSFlZ6RTzaUMgtlrdPFQ28Ae39vuwJ6df6ziwPumRDQ0R
         pTRVZwt6CtP32gQW4J/OFIBNZK/kgMDCIrhLa2oZyxzWSir/f9ZytZG39d+pwnj4ih45
         E96g==
X-Gm-Message-State: AOJu0YzXAzqRtHtBR4glv9tjMunrCtcgsZeP85CLkAYftS79VRGTvVQC
	L23FWfGa4Dqh6AeVHdVrYkBWr41x0V+mipXl3GJNJDnEnG9I50wSt9kdC0ST9E3jFN2bwG/7w5Q
	2AZl8vPPNfTST5uOj0lZM9PJzQlDxOmJcqsZxJUIsSjwFAsNtmzhVhS+ehuejY6XtFdEY+EI=
X-Gm-Gg: ASbGncuFyohUvQStY5TXwbLT2DuqfwS2qCibkedCrS9xXxuN9cjmOM4RoXv420rOFDJ
	/Ge2rHPprKoQN2FRINvou1HaJnwPy1tY8ERG8ujeWmaFXF/FD0L9C+9lhc3m6D7APrlBv3nVill
	pOM3xy2oVa+wDMvkGyT/Q8y80CWM6d+S/ED86vjaolNExt3MJmzb9Ov4Cdi9yuYzsQhTjhSg1w8
	zwzI/3gF4sXk0Za9Ztnil3njjOQyjOPv8qSZHCovhjf8Eh3OYYwnBhzEUTuTZtfQ6KyLxL5/OJ0
	bYaCIXVWXkP2OdGEYfDLIZKE6b1EMZtOcpIwHoAD9833ArJLR+vn5Jo8WY/XKY+GLZ8HK33xmuj
	4DX1uctdkno5ODrCDQFMdmJbXnChtqkHXI1lK7OmbQDCVCpqRvPsg
X-Received: by 2002:a05:620a:1a12:b0:7e3:2e47:2315 with SMTP id af79cd13be357-7e3378d1b51mr205735585a.2.1752531849055;
        Mon, 14 Jul 2025 15:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBFrbAY+gPHkBAwIA4uZ1qsHBDAYeBeOJeupTbO5GJu9snEQNTAQaqDuqv+n/Nl0TM+vZpZw==
X-Received: by 2002:a05:620a:1a12:b0:7e3:2e47:2315 with SMTP id af79cd13be357-7e3378d1b51mr205730585a.2.1752531848546;
        Mon, 14 Jul 2025 15:24:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b82dbasm2068343e87.248.2025.07.14.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:24:06 -0700 (PDT)
Date: Tue, 15 Jul 2025 01:24:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
Message-ID: <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1NSBTYWx0ZWRfX/AZG+7+tHNw8
 RPwUwpVqZHsXLWv2gNGyJ9fM7JxK5YazHA9R4ircaOB8c6RTpnZy2WAw4bFVu1H9M29ZXM2OjMV
 DgKsdWruDVwR4aJ48lTQAcSfxoYhq+13FeWe/mDuT+21zhd48BKvlcCzM4GMu60SnPdbOnoFV2G
 yfV7uEOT9GH6tEvHYsaJDVNdUbfOvjpekhQOESSStdPED4fb/LcFCYPMgdkmj+oevkch/sKr+CX
 AbJLPY9GOteagWkdcVCKxtjoA7cCaUtZe26BRypgRAoXYLE0HAXIjul72sR3vvoEP5bLNJP9d+O
 5xJJ6DhZ1fP4iWcx1yy9U83fG+Ds27XkRBlDB23Do4bi/OP5L14SABNOSb4+vR64ShHsw0fP2sK
 t5M1cE08Ha92Q0g1lclC/Bt42e7cK4rvkdeX+wYzBcoecsGrDn8pdaZMqRtwdaXO83r5l8ly
X-Proofpoint-GUID: 0EuvK4WIoHruUJeB30kLfpSz2GTmmnUb
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6875838a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=h1LI6ZcXZoHiMgv-rQcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 0EuvK4WIoHruUJeB30kLfpSz2GTmmnUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=685 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140155

On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
> Hi,
> 
> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
> 
> -Akhil
> 
> ---
> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
> 
>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
> 
> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
> 
>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       qcom: Update gpu firmwares of QCS615 chipset
> 
>  WHENCE                   |   3 +++
>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes

This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
etc). Could you please confirm that the new file is actually necessary
and that it will work with existing SM6150 devices?

>  3 files changed, 3 insertions(+)
>  create mode 100644 qcom/a612_rgmu.bin
> 

-- 
With best wishes
Dmitry
