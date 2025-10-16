Return-Path: <SRS0=kyhd=4Z=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA719CCD194
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Oct 2025 11:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9210CC4CEF9; Thu, 16 Oct 2025 11:10:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFF51C4CEF1
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 11:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFF51C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6vtZO016723
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GxhIOFG6iqxI5KP3+M3TwV1S
	hLeuGaJx9H2WamvhzeQ=; b=VUVdhx+NP0DOZst0+1rWVCIPgBKL+ieimHyR58+M
	PxMMf+f2mMA8wwPbMMhDln6BP70cbqBanjgyrPYpfPEMDV+VYApU5QiP/OWTYNb8
	O0knB3ThSoQqK7OGOQZMDcDiiZnoE0w/jisqQklcBpoKgUXBcVrKyB5IJ7u4bd+6
	S6mai4Mi2piwv1CAwaQ/Cv4PMpZbv847127qEOX8XYEQFKpLWMmSrkl4UhseeCBL
	JnD8F/fxJQsCKotL5E4OeXAbgoAxa4QtxBzpXDMOEHuvCq5kYcRk+YZPqhLoTQvb
	N3CVfnpYy2oBi0KKHakxK8GMyJZG0BRNfCkP7/atqQUZTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtd0rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 11:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8645d397860so341572785a.2
        for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760613033; x=1761217833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxhIOFG6iqxI5KP3+M3TwV1ShLeuGaJx9H2WamvhzeQ=;
        b=Bz5UFe6448twGkWRZwAKsFtOcZxuTroZwfnYMFK3TiTAlIwdGHpbOUsK0qBOvtBwQw
         DwPalLWTqB/yDh4VnDVeaxAviQ1uaCjsY1Wcy7zn/lQ3vkGMjuZH8f60w3CbX4otW5MC
         jcap+us/IylIEovTpnoOP/egfMU/dCCkf8j3opFom8p9JMwQQV1nhiifw5KDdLLAutVX
         fKxc94h2T4DJ4s3ItSOwImfjnTtwI9O8RyrWJBOiVuOsL1nLGpegBkb7BMXnZfZKIg37
         SnxAWp/tw5kQEc51/fFnvcOv7Fa7JUhJVNOXt9pitOeI51bpCqP/rOfkUF3Fo7UBkIlZ
         eHCA==
X-Gm-Message-State: AOJu0YwVHAoTOM0LGjYeWtuzbIJlwGbTPB7FI/TCFDGPyes6h10pM0/a
	E2RR7lwBJLCAZkowFJ8xz8IEE8moWL2MVxtRA1tq9gHus9bf1i/zJHPvhzZeMFeyuuSb+MMeV0z
	/aWJWvxL3n8jtLLurFspLKD+7Tm+3krM35L6a2XBtdB99m0vq5D9LMcSfk+BZrOk=
X-Gm-Gg: ASbGncsDQWJeHnxV/lIz1C91/93Je3z4Mhevau7TVWGszvTqunVJMfKHUfvKZGyG57X
	UuiCRUYLLu3o96cbhjid5w2eutYV69kQ4F2UZvdoDT4gKB4m69+1Vl4F2wXF8MXUGl1oUJqBx+S
	RDqvaW2Nsey3HkzraUlwH/NxQM0R6t/H5f5d0rqwrZeesrcLCM1hw/LRpa4bEOSLTmrZF9albrJ
	HtkRkFMOSkwryJ74CpxY8JsJMXdLFo/t2K8WFtkMGIGrrx7Qk8T/Y7FbYCIJvRN9GBW8P/NZP0d
	AlmEBbeCSLpI7ZBNTe9S/LvAkwGdqzfGl3eIaZoe1OsWFml7L7lTWlYSiMNMWleX+KKFYRnTzWE
	U02vgWAK8hUdElBjJcvShYovcX+F+og4fQ8T7QdGNQRPPTIlZ9H1oT9BJZgNIrBPuhNp1O0fTDE
	OFnxG7AYqnXTQ=
X-Received: by 2002:a05:622a:40f:b0:4c7:9b85:f6d4 with SMTP id d75a77b69052e-4e6eace808cmr455327851cf.22.1760613033414;
        Thu, 16 Oct 2025 04:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUuLhnUJlARzvJto71luzUVp2oW5A1vbn84t6MJ0WO1uWHvFiLutAx9ve9ru1l/KFj036ItQ==
X-Received: by 2002:a05:622a:40f:b0:4c7:9b85:f6d4 with SMTP id d75a77b69052e-4e6eace808cmr455327331cf.22.1760613032591;
        Thu, 16 Oct 2025 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856f4e6sm7036363e87.95.2025.10.16.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:10:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 14:10:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: rename firmware binaries
Message-ID: <tj35lu3t4jjo6gyc366awdqn53jjo7l5rrqtgac3qcpflfu5wc@4pedmvkwzloc>
References: <2416fe97-3288-47b1-478d-088e81176b32@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2416fe97-3288-47b1-478d-088e81176b32@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: luLjSZxZyU9MbzsXA8UH5TPeiok-n5Kg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX3sxF6Uou7uGj
 oemX7bVynDEOoH0YqCnuLCX+2nX6ZkzFtcrR4ngrGkmAxhZrpW8+FlaxCKhh5uHU6h5V9kLVa63
 nLJcapDoxh0w03PVzHbUpw/V1AD2EpnpAQlhOd6viZdgX6LAbvPwiEpmDi+WxeLW4YS/WhYQYoq
 B0otuoF9XWhQ3R4zlc/7jiU7R0rhLqAip49e2ZusJPLxJoS2ogp2eKRQpJBgmyD0eo7HYSzriBX
 5fCttelR7cPEU0zg0hJjmyshV32pbJP0VRlo0WGakssf4A8TPcfcJXQkXuaIXdworas3SMYEfcI
 ZIITWNYkgF/k/LsGcPrEqc/aLvjHjn+CGV69iiXRrhGHUKetO3IHOdAysCMdNM94kw6m3yBFaLC
 /3/2YCpKKBssDzS0gszQXNAxcNcx4A==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f0d2aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=wdZ4XaX-vi9fvrXemV4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: luLjSZxZyU9MbzsXA8UH5TPeiok-n5Kg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On Thu, Oct 16, 2025 at 12:36:04PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit bd4d2bde91e121c5bc85e6950a374a2e0ed854ff:
> 
>   Merge branch 'intel/dmc/xe2lpd/2.29' into 'main' (2025-10-14 19:25:50 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-binary-rename
> 
> for you to fetch changes up to 001b17a12956aeb46a9346862d05731c134634bc:
> 
>   qcom: vpu: rename firmware binaries (2025-10-16 12:32:01 +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: rename firmware binaries

Thank you!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
