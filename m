Return-Path: <SRS0=Csje=HN=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C5C982ED
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 18:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 374111F00893; Mon, 21 Sep 2026 18:58:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790017096;
	b=PESV+yjoZsSG1hHgPIeRCpG1/nALb/W/A8MA7XbycmoaN0aY+IAL8S+KMK4qzrLe6Vjn
	 heWEs977zJM+3n9Q3lnQwOlgnVK/nIzHdT5tK92wwyALCWffJYy3aHZ9/99CLcdxH3KMS
	 YL03zxTydlkAyeSfYJLZybmrWgzEhXNvCggF1pFRoh/dm4hL2FIEW9H2nTLwelk/dhCX5
	 iltcjsc2vfGqv7bZLdnZo60ak3lNWUc1vrO1QMfMtJQ9oqZ95Yj8iIGe5xydnYi+yXa6+
	 omRxsOKjG4dGqXvmHnvR3T4efyVYAkzTsmsevuNvFW21GXMfIPIT8PLoXp/hkE/mZNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790017096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
	b=ybtMJMq5wjP+e9Oic6d/gvP/7kp8shpdfOHjTObciBwhqmKNqD2K/xEFUWMYPaSrHlNy
	 5wVdz7KXGBufbSWsgWmQjkS5NXKta+gRBp12NnviSzRP4EGGbkx5FutnPiDk6cl7uUtjZ
	 AJ0hfY2jp0BulYrMJVaaV0Y/pbbz4nkMSFK+/ZsuSliWUXa83sNdoybHr9fW70YLPEfMa
	 gO3CeP3L4uSORhboEdJyLpZ4KfWfOnBCijhPr7y7kLMtqtDVd3Df6IFmv1ikSBgThAg/V
	 8bxYn6mqbSNBvSCo3XRJGAotilKx4/88QyK7N33iuxVU4Z91EDmr+OyVhn0YxQfDPrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjmgIUGC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sy1eeK3F;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 337251F000FF
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 18:58:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjmgIUGC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sy1eeK3F
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 337251F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNDQe1313647
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 18:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uUXkYzIUsHG+2keQKojwyw
	n4Tl5BjL8Kz4nL3lPB3pM=; b=cjmgIUGCxQa56erxyQBavuIbHcWHKDZ+Gy4C55
	a2f/Te4QnMEcd+E9MIEYYLfZvirzvgJFbOeJCXprsFBiVRNsF0hkilpnwuxQrGrd
	JZGk6G/3WNEn8hY2HKYYoFqKa3g0aquIKeYjcSxPhx/CBx+UnaDh2KxBorO8e0jV
	B2X9QVjF6G9w7fsjb8ybyyV8ZI7yDW8UXEEZ1O54ubymAILozlqcbx2ArKnhWqR0
	RwYCOK2pY3pUavF0HlxZaPOx2sZz16PgeX1aSs7TKIPzb/ieQEdd0YK+kfmPiHFc
	QWaFrs5pcy/kIqLGGSr5JfmEGgeSejS2wkf1Ay6ZqG4DVK/g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerc7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 18:58:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc52c77089bso4873923a12.3
        for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017094; x=1790621894; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=Sy1eeK3FKLEYmDI9pufqNQj0kMEW1WMyN7Hb/cn9ObWtNCHDRj7nJFh2qBzpvKEiVv
         z66xD8xKzZmnhBrhqhwzFOJWt7YgKPuWjJm8f+0xOieVzX7FhLHSrs+5G3Wlo53MxJMW
         +CPVjx9urR6sAt176rev/VsFjezjwFGDMABJPFUghLXIbcnRRw9iZz3NUNcKpMMGSZ1O
         4CenY+Er4PCK2AETZhj+88tOMCKLkmHw8WTR2s01CrM2LY3pLXx8QmQsxTc0PnAuLmDa
         Z664SB86Lae/9wvcXEtVHkHFW+NLBcnfF+VS+wVbA5Md7RBY+xW5BFrQicw4aFoiNtHk
         yoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017094; x=1790621894;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=2RJoFkNvhErfBYuh0UL4Y3EjEZlFodkM928eyaEupPlSOweQ+xYwIqslkHXu/+bH6Q
         mkf0NhdINvecSawjtAG3+vTyLWZaoyXVG8yqZH6uyGEvK/LQlGciXLfOlEHTCIG3QiJg
         ioFmsea8tlnMis/JYbmdiGq4OCZERxsA2Cv9/cKlkTlG64mTZN/Ma0pd5SU4s+DvDaZj
         a1tWROcYD96TCp4lhDXK98YYebAm6Hu7snLF9lHjE8F4DPoLitpUHQ7dqx6BVVeNpVgL
         TmFGVS+g7zwxDXbppRuEpRQGrSsEyownOtcVNhSLMXJU1e1NgVI25qOBHg/CJj/PmE3w
         Dwbg==
X-Gm-Message-State: AFuF++l54N3aAL3NedD/gWpCz6N1QNcvvoTSZiS3TlzzFWdVSOwwtuxx
	yUwKpBbf02AjUEBgxLjlw8gFOO1ifPjPIq5QZVKkPw7lsNqcETozeflfYgLZB+5yohOGi8aEnmA
	KyUhBVKcef0r6Trt6XN3KXsbe+ieOXVpb8cr6cKHSgcjytoVSxr1jTfjKt6/LKA0LHz8msAE=
X-Gm-Gg: AYBFou3lh2z6cL8RYObAQcYHLW86jt1nqNdp/QGs/0LnvRL42xYqxXclStNDWWHD5H8
	e63KLI96FCmcXCcwQu+6wKHBLgwnT7tPCG4rVfHnbfL8CEpMDUZPIFCRB6Y1UVcehjNoPty38oS
	NHgh06qmM1lQkvUn5HLQBsy01kdwnE7L2pDW3YGtrvv/dxDgRwjD2KekjSAiAFxWyBAXa0BHaxX
	BPDffLNCOdaGeJ6Gy5DV1kHwo8TkM9v8TZHV/avBa1L9OIYtUcLgKVgzSzFr7LUbzIJ/3qzkUZI
	RXfeu6EYpuiViXbFlN2oG71QK2pwwzN6kHSrGIi9rRKmIhq2zx3F81d+YMcKGjMiz/QmP2ZYz0u
	s+pEeLj59sRAxunxT1c9mX4KNNRpIeNvbxRE=
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267308637.40.1790017093653;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267268637.40.1790017093097;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248fsm11523188c88.1.2026.09.21.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:58:12 -0700 (PDT)
Message-ID: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9bbyMDVzbJm_qJeaRL_rEbSm3QKroPn4
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab17e46 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=E4bmoj0mVIXTqPrLO-AA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 9bbyMDVzbJm_qJeaRL_rEbSm3QKroPn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX+6V8fZgiE8s8
 pg/G3jgmt5gsPSCZ+PpOMddgr9kKx1AeoypKJ6TXwyDnDz99VxoNus/MDDeRItAzHylcPXa1Js1
 AOvJHXgYwVn46QweNoUsmtWO6Mqj65KCuqhuj087A/r8qMnDe+qTCluA5STtdoZX0ZjqExDQu0c
 lLRh3DtR4AiGBnoZXJd6ufdXaPC/Lr5FITF51MMJxuPunzO2KDdfIEE6zxTZm0EbMviuZmCOJfZ
 0zCdcww1dVLysGI6/Om9/IcBIOFHrOb9kHUjJRg++KZoKE6SLt+cpAuggVTsP8W9EXaozdCESNk
 uK7Q6IgWkbdIz4hn+u1XGB1GEITT/BxmA/CKOqA0FpHiEU1bxkJ/r2uVxWTjHPpH/WLmr8HveJa
 fMS+f6EyKZ9ChTf+3OJvQ0/+CX+UznrUgFBViJjOAFgy3Mw2BLvcZRXsLh87IaBsp/ZmmBVROBt
 b3Z9VvQoDSuBVGLqhnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX7pGgRh4gQlIl
 BnoTyw1nPQpTvN2/sNu0P3qSE7EFBcbRHQRVeCUxxBgkb8SDrN9Xg5XWj/qj8lzkhftRppCMvcX
 n0T9yCB/iOAIfzO5svKfYg9d8f5KYnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210276

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there are two board updates:
QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5e0:

  Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260921

for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath12k: QCC2072 hw1.0: update board-2.bin
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
