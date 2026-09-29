Return-Path: <SRS0=mZhp=HV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72732C9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 05:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4836A1F0089A; Tue, 29 Sep 2026 05:43:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790660627;
	b=BlIqVIAJnyXzPLLS8u5yxyHbz25VgeBhK0kJPSIWHgr996MMzl3k6eBDK/vrHzeOe1bO
	 mDC4xYlhmyAtRmcnMzOE0UX/Wpt22YdgmmjTliVZrzoCrxq8fHTrnm1beNIJbdMjLWhKP
	 lv/FheVN12J4xb+1sC3Ffcrr/Hh76fLtN7CSGVxhlZiIDAFWfhBYbWeJy2aQnKLo3lff4
	 1HSFqkRl67LMtdHNC1QtZsClFwPWwAw3qoe5XgoSKmkbTb5TJYxHF6XGeyvJ3ML+N0vKX
	 utisajDZbWhiMROagppVmzLwDCI4kYmjvq8wFUojWttsfklGc9Y+lqeX7cijZGszNRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790660627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7BbXlzHmP4i6/PK5+5uibYy7qXpyUAASNe4nkkIfc40=;
	b=R4zLmSdhQqKQ14hxbz17y2SIgP6GDUNRT8YaUV56noBLXmAQZbU/W4yrqF9bdqetZYhT
	 aMEq33OF2JmOvYe85RJaO9G+6tcI5rDiJ2NcZShM9NUbUH5Xqe411zKJH+7iksEIQXD+7
	 PCkmgXurhbUysiYS1gc5q6gR4a6Fxs3DmTkCo4KiNJF2NNoIukS8cT2Qj6P2OCAp+ToCe
	 y/zHSSKieCaXpfICKMBW/tTaGJfEMuOGcbvgOZ37VKeg9FabS8NW19avHhRSVn2pXFA9y
	 TT7iiwGbvVXsH3Zny8yV1TdH4xe5DdcIu91EWlWl/fTR2xLnv+bwmEa252Ioi9dqpvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=adHONm6g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWb6eQe2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB481F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:43:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=adHONm6g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWb6eQe2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9DB481F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Tx12991278
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7BbXlzHmP4i6/PK5+5uibY
	y7qXpyUAASNe4nkkIfc40=; b=adHONm6gFmn5lh6TGKkbOSMaEk78uqJFNeQt8i
	LWil1E418KJFzmtNTetO6LjuGwJqBPvz+jzsXC8VB6mLcOd95/TNfnCn6dsFm3bo
	+ooe0m0+Z6afKhAxykJONtBta7T87HypJJR94fBR+ZyrF3YPTvs3sQRK9sD/KMhb
	cKMFKa13pz/2+q00rkvvigjp64SE3dNaNNr0NITrVZX2ZbtiUyHqyfNDjBKQuYuA
	CDrnqZoF95VYfd41GVllzn+8kJn13UNE3W9gq+Z8+SnLvcx8hmFg1CUuieILbIIp
	QmAkL3TpwfbEbG4x/SvPpKDWGjyzcgFe/sFw82cOanJ8FwUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnabv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:43:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so3825873a91.0
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790660625; x=1791265425; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BbXlzHmP4i6/PK5+5uibYy7qXpyUAASNe4nkkIfc40=;
        b=gWb6eQe2cpnhXBnzoOyVv4yEgbqDqtmsgD76ILWSTnkGjJQvVMadeiARKgcDmqm+Nl
         IM+rjCYzNZMIThiiQ7oJbqspiNjYilsL0LEl6AHnJ1ogK7ABAl+wAPrYah4XGz5LjoCY
         ydQIti+5p4JzJIsyuEzT4d14VGn8ZKqU6uaSmrWc5KqPQxHwyinwTdhmQgMdJd/Ebue1
         2r9sl9daX2MrAnw3wacNT2nroVEHnxapV9+qv2kdvBpwh2UxSaYdCT7AOVig8DQ5040O
         bKiV14rGb3fE9l5urW3qgnFtAgvuW15f/uhkWTPa+YCvyc79vQM9SOQNFoXVvpuQHw4m
         lXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660625; x=1791265425;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BbXlzHmP4i6/PK5+5uibYy7qXpyUAASNe4nkkIfc40=;
        b=ClXoHD45jj+DelRpzoRs6jJFQYEd4vZYdIBuP1umNtxmKsbEMVUa5BLeHUqA7uPbzn
         JEv4Z5rFRsCBMHzyQ7vk4dl7Szmlk3N0E08V76EIs6VBdEsWRl7kruEZgs7JfNliLODg
         rqKtdjl+k9mOU45zVo94VBjoSzTbCnFuPfRIKgX1U8CyfLCg2wOpi3hAqomLP6GQMkm6
         kvY/FBCZtEOkZSuEjMuTBf5yTi0W6po6YtA5q8ViHcLwP7Bfft2z4vu8uGZ0GhOt5ReW
         yZYdW2haZnPj7AHVUW91PNLCUMnUOdg8qi88E5zofrFc6TX7gN5yITL6mqqCAjF8CQKw
         52gw==
X-Forwarded-Encrypted: i=1; AKwUvBz4kV6IiqB/pbd6JJS+3OXurlewYmC8ujduisEknvgP1EMZIyM/qgg1cUSMh0VyOTW9AJLaZPzCBKvf2VXwdA==@kernel.org
X-Gm-Message-State: AFq9FYJ9GvC6m87VYmi3FiT4q9qeBl+3SDfHMEXUszZDi6MCHacYxvS+
	KeKPNyXde0GDHpo9+gnV21Ps1nBZ3Ps0IkocIUsPk6I6TB3kZEzD9q9At38+DbdhBrFv6nLM6Tm
	Cw5S/tj3Pg6dzDF9KvkwwE5/GYOaRiPauSUyGVFhtzQSHm1IIqnWBv9eDY8uWXPd7hxrJx9s=
X-Gm-Gg: AYBFou3zB2F2gcTss7+62dJ6dG+YCounNv8P+eF7U/nIXyukK3yj+ZYcfoIfhLyFNVa
	7NQh6IckanWAVijBCwQkrk1+WHx5P4nEdDqG/4meR7CHkhQP7wTVhiWkFvWEK0e3kPye1RHGml0
	9JsEXGVlNcqQ8bq/gy+qN/lta4yU2uOtvWYFj4BKT44wAf9NTiNBlDX2S5sajAwFgSWMe211X7N
	Newu90PqU6FQv693rPtp1iHgAR0tmcZzTUeD5Bn2dnr3OFfI88ABTo7gsI5WMaPoSqnjH2uzWt1
	PdunECjs0MLwo1hk0+zm6iT+KeCafpD0P1AGIsmiD8Hhu/ajMR/yLflMFXV8SJJHC7fVkX5LK+u
	So7BoumewRXNGpJwKHYjtgTsZbo1YNw==
X-Received: by 2002:a17:90b:384f:b0:3a0:cd4d:5133 with SMTP id 98e67ed59e1d1-3a0cd4d55bbmr8328778a91.2.1790660625064;
        Mon, 28 Sep 2026 22:43:45 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:3a0:cd4d:5133 with SMTP id 98e67ed59e1d1-3a0cd4d55bbmr8328756a91.2.1790660624534;
        Mon, 28 Sep 2026 22:43:44 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4989739afsm1114860a91.1.2026.09.28.22.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 22:43:44 -0700 (PDT)
Message-ID: <131468ab-ba9e-467b-a5b7-c645320965fe@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:13:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6uu-VJBEi2sbM2NG_OU3rNLOOgF0dA5L
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb5011 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=_auUsURdXUbBIUx3I6IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfXxz0VtOzHObl3
 LSYYAiQZAy1BajdUwS+DAOORd+skNHDImJ1UKaDtK9HCC4PwESyL7RzuxBG5R/OfPWQ/FCw9dfZ
 dBI0VlE4r83IDEbEB0300JbtkcZ/lmqaS5KcEzm/dJFiYL6ldpr0YDLckugbfTYuDwHkpx/Yk2Q
 ieak7Svw5ZXO0DbeANxOOnORi9NPW1ox/c/UquWIJAGm805rAizqNxM7ujm7Sx0zF058E155YLJ
 pXyGxXX2aOsWwLhCJ/SAEa9eKY6GjpA93X5vB3SqdTXrBVM6kOkYMr+5o5n8cMVLLJeHBSlIgK2
 vAY/nIzs3M532R9RJJ6l5Yc8COmzS3x4cLYNhKLzUJwZf7Aa7MF3ov1A5s8tYtmY/vAKcnvlZho
 Pi8mvfCoZQ3jQt1lLl7TyHnzPoMSAaJNByrMIFX1z45YXgopbcRY/CsmfnEIctWP5Cdr3yqLbDJ
 e+Un65rTf3l/IpdNbwQ==
X-Proofpoint-GUID: 6uu-VJBEi2sbM2NG_OU3rNLOOgF0dA5L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfX9cnFdNl4FcEY
 +nSvUhOUtuN3KVJsvwDZYIK+palVvg8ie0Ab+jEr0jDHPcvUXyVNviY9M5yJEHOugUw5tRNd+ra
 fapMbr70up7dncsQBVARbqFT2LIMXkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290022

The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:

   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hamoaradsprtm

for you to fetch changes up to 4a4a017e7cace118dbc110007a44778f3d12f080:

   qcom: update ADSP firmware for x1e80100 platform (2026-09-29 11:07:25 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for x1e80100 platform

  WHENCE                     |   2 +-
  qcom/x1e80100/adsp.mbn     | Bin 17922440 -> 17930632 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
