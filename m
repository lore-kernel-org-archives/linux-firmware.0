Return-Path: <SRS0=cpZR=GT=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA99C61DBD
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Aug 2026 13:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 154B31F00A3A; Wed, 26 Aug 2026 13:46:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787751960;
	b=zmc8ybrQ0zOGLan8mazlolkGnq7hYxgJvV3wjww72G/CoaMom4gEtx7JgtOA3lpZFDxr
	 LEr6rNo/iC3ci5HJpRPC1uB9g5ZYJFdwuY2SoiPuIVLsviVFy1bxexngrNyafKKP0QQm9
	 oyRpSU1p4GXpC9wCuur1OTa6w+RJkZLC84rX0fMEAadCEOW8wIkQ+EwKM+rYco8wiESjg
	 YkAtxj4EmKF6+SxVQ++LC2Xn3Z0lAFBspuIb+CsxzyNnuMfnnb5LrVD6a6UqYcn3E5940
	 yRDwvF7XtgMyGsS7sAPlBd2YzkfEU/jMrNZ95FUBBhcAn+747bP60jH2IV/quvsBIHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787751960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yXQpiAwPaaaVwr1UvCw7CI8e5YesBfS1RIGAaOLzEmE=;
	b=x7WGlbjxzB6rjOEzA+Vhkg8OhggDpFwr6rDlu5/rF6+sHQV7L1iZQSmZw4AcBq63bhPR
	 HapaNQ0pgzjQ+17HoN9nLXFL9HzXvw9Dd0DQaL/UmrGAPBeFIKiMY2jyOOWHjNEW7le45
	 ri28Bya7OWlCMb5TpB8V9t/3gmI3zyuBC0OH+s9kQHnIzPItoVZmcGEozy34AwsBj4x3p
	 CFHJ3IGx50C4mBQlrKMlDA8gDgXoOCX8E3+nzWhXb2LahWQMa6GbzdUx8yFDh+msGW3ZV
	 JorTCLIWYxIXOHw6+5ILDjNfgzUU24dGpqoMnvhisIPW8UorlCW/9zzLw4TVZK/OpVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuquElMZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrANwnjg;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64F841F000E9
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuquElMZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrANwnjg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 64F841F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDHb1R1617704
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 13:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXQpiAwPaaaVwr1UvCw7CI8e5YesBfS1RIGAaOLzEmE=; b=WuquElMZoQxnu/QB
	7l2Q41E3KBQi8eY4sNOfC8lJOAdJ1yuouAV7DA9kX0c5GAH3e1j5xHQGZ8rmZm6e
	Joe5hm5nTzJgbtZqi6tiLOnfj6QDi6ojfAs9F5azn2zg3XhyVA4GGYVGb30kqWNL
	cwAWlL9HefkHqLMQtNwQ5JbmRBMDcZAIKGUFBUeqONorhEnUMgZ1nxinnEoDPTA6
	z2aDXpNPTdvvndeGDcLCu7zHnchj3rNeBhmtDGIyomToKtJQq/Y5kBq5VNbBgeuX
	sb3jsftCtlHcq+eV/OG14M2asfKPkdHFSWLdMwrz6tO463PWo00lZtl5Ltjj++1C
	/rPZIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbr3rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 13:45:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso771936a12.1
        for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751958; x=1788356758; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXQpiAwPaaaVwr1UvCw7CI8e5YesBfS1RIGAaOLzEmE=;
        b=TrANwnjgVyNNQuV7TCnJs7FtXPz+JqqdC0OINJExrYCayUEO52JITt7WRPryxIy409
         6yyu4WlaRSkHamtdCkTdDuUfE9g987BOYZiGj2gwE372BB6T5m7UB+klEYComlKmCXfV
         YwGww81glvPY1LPTisG8hhqrThG+MckeDgj2Gwf/uyQIFWeowZrVPI0jH3r74/xaBv/k
         hD9MkMEuo4PU4Xx3QwOac0w+hpZ/LW+n69bWnr701W7vSFMEfjSbtqP+ocahu7BtlhP0
         wE0jl516TwjQcNO3vC+fZAVgcj6Vwz8EFUvdNGa/YtXJP65EkSrI8cnJGb/F8UhFXyDn
         ibeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751958; x=1788356758;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXQpiAwPaaaVwr1UvCw7CI8e5YesBfS1RIGAaOLzEmE=;
        b=dML2HKwxsDMJ+8UNm6pBeNHEYCaGFB6aQwN/EitAhf6LDOsgfGN4ejY3hkND7YZT1W
         SmgwJjumgUNrIb+UorirSIZ6tT6QEKMSIKesAlQsowFS/5bd3l9FsBYI+K2AzUZrWpQM
         G8wLbt3AHEDSN7TYHS1esjwM3AxggeQlDgLjnb93WLlgy3dMpjoS8njEe2V54Ew9rE2i
         wGAB2su8s71zP6HGJikoUWz9hbWrIFbfO+NuXd+On4gtvV6uBjWe6RkSxA1If5VVJxE4
         B0Xwn1n5eQtGfUPsItlJSPTDz2gLu/F+lo+XxI5ulXIaXES+/dx+XbpIgnuYBVywSTRY
         U4cg==
X-Gm-Message-State: AFuF++mtb6R2QEhGHsokiUJAzNJXiYVAyzndbpkBuoVqRK3hFJmYHA2d
	eWy8oU/eGUu5TIJvD2sbKlzhCTTSFZmZ9zjbMQ8TLVardGn81VLvTif0uGSrUF7WbI1xIU1PQqo
	cFcWo1x+tOoHV854b1k5JAD+yE/TSrVIziLvTyP5AyUBQaTbn4Nf8ei2VG6vCc1edfE/GmPQ=
X-Gm-Gg: AR+sD13veqN3frz0nTkRpHG6mt1kem8AgZmRLjEsNHESksLH3Nx3/Kvgh+rnvKLuz3a
	ao/eCR88TYhvG/OpGLKk6P84YHZMnOjt9/2bl9RC/SjnSY8N3sQ82L7ZwVw8RbxWm1eybJn75yQ
	V/xiuZCJcXYP1TLEORAjA2by1Cag9jR1ePa0pyrXr5MqQyCLgivBUbsZvFx4C/xRISc+5rDhubF
	8/PFohef6OWjN8tbMt71t3vgaqgbfivvx8548NPKko+adr+d6G77S+cR7TAg/rbtzZY4vNT3cwA
	N2oVE+9gZNWAj6c/iOyvOJGocLErTjIv3oI9mXg02m2r1sFGjHsHV3qGrhjvCywOEQmZy1DYdST
	+feh/yq0QDfir2wzdu4EJg4TZuT7faQO5
X-Received: by 2002:a17:903:b45:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d707af1729mr133685375ad.11.1787751957859;
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
X-Received: by 2002:a17:903:b45:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d707af1729mr133684345ad.11.1787751957456;
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c361a4sm7742395ad.76.2026.08.26.06.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
Message-ID: <18b58b9a-2fdf-40f4-96e0-fa732c5fbe4c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
 <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ySh6AMtx58z92CPestxCufL5Xxt2qcI2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX84bjf+hg2S8w
 39/6xuNQDH+W9Le2SlRZzPZ1HUxIlMFWvGLNgQFcLFswfHcRGcdjJlbbCo9Cf8V34TSufRV966m
 VnYFBlxMBiMUNWqReHwNhgxFfDb6sSU=
X-Proofpoint-GUID: ySh6AMtx58z92CPestxCufL5Xxt2qcI2
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8eee16 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=eogb4HBknsU6tHRqazIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX12ZxULHhYbfN
 PwrbASW+9aFXgOUHn+UDAERkjobTO8vmMpnqZEiAvIuJN+pqPiuITQ381iM9AfjSDpELeKJiI4P
 Fo53zqtBXj4R5IGRS5PiZoOh/ljEMZp6ywxO2JJw259tDJcRxgNV145aOEp3wf0sQjsYTHbB4Rb
 WHEvgTI4mRnTwfq4t8OX3Cg0suwQlxEzXeJlBwWGxNR6TaedeM2bdnKAWGMLtIXjP+HD0YCkVSE
 QwZjpbXd8Aw87R4Eof5+Se+7Hk6aCoNbOFiVd2ciRWc3+j9Lvo4tadsBp4mrsCFsszgJoP8Zf5s
 INEhXJlTuCSEYtxSIkuRlNeOHPe6zPb4O16HG8tKs5vyyNcmA3UPXAnSICQWZlFnouKkQ0fCwTC
 1nih9kIHxpdFj8LQV+Mk+NFOoMONtVqdMyj01Sd1sJZzDnbOZ7lM0H9mUtQMNJ465ch57Rrhchn
 ZI6ZGpwbhoBryhB9+9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260113



On 8/26/2026 6:17 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 26, 2026 at 12:26:38PM +0530, Saddam Patan wrote:
>> The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
>>
>>    Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-nordhpass1
> 
> What is the difference between ADSP1 and ADSP2? Do they need to have
> different binary content?
They are different binaries as they are not bit exact. There are few 
register configurations that were programmed different from the coretech 
side. Not sure what the history is with that. We are just pushing 
initial fw based on a CS sample of NORD Auto code. There is no new 
change planned on the same for now unless there are functional fixes needed.
> 
>> for you to fetch changes up to fba487041d4194d30fb599b04285ad9cd766f281:
>>
>>    qcom: add HPASS firmware for nord platform (2026-08-26 12:19:47 +0530)
> 

