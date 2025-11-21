Return-Path: <SRS0=8/BF=55=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2224CFA46E
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 04:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AE4EC16AAE; Fri, 21 Nov 2025 04:11:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97137C4CEFB
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 04:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97137C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKApZj1886198
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 04:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TjpEL9kGKVSSVdpjErV7Yw
	cfYr23Zpd6aDPt2NCvETg=; b=jnY/UU/Y7IbEfwsuRANTgqTc74XN3r8iKc5dDc
	DqEneE4+rSHEwHTM6UJKUUbdFpBXRPVUsvJgSFNVvOjxI/JW8ZlKKFbXYODm7J3q
	IXVQxenAXCW+gtWVmXQ3441uRcyz5ttMAO0aRa8cA1AFFHe26Da6o/ufPo/+V6gb
	Ct7KlG7GQlGycPefYwKaQ2YchE9Ls7qDPGh1irVdEpoNQ9zzAOZxvYUtVIaZd60y
	lZ04FNSuBs+teS8BbaIry7uW7asGUtpjBKYPLznbAfycHGMzCv+b2tH4lXIHbmWk
	I5YGz1n9EXi0DKWtOMuBKZLHU3a3kyoSCsA00WHBLcbAUuZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver3wy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 04:11:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso4071845b3a.1
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 20:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763698269; x=1764303069; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjpEL9kGKVSSVdpjErV7YwcfYr23Zpd6aDPt2NCvETg=;
        b=hJaH+KGPX213+FYvb38kkNrBuE/7T3Aqtt4hI2xW9Th+0JUx6abRXo1X5XDzOyr7xu
         XoKeAPYmiVLaOlgCj6mvidm+2IS7EkAP+zy+ghn3zLQGwxff8W8BxB6QrQnRkYd/7y81
         e9UH+HWwwtvCO0RXk9q0tHlRhho28o3kG17GAi2gYgrgl7Gp88HiRYQW4ETz7ZYrAtxp
         gNdG7i6E5L8nygpfpe3CAdhv+lgXgJZKx7+Ry6wJ/lAshzuU9NSpEtL7EPKfI0baitQi
         4znM5CJGex5BIqE7a8p36BKzVUZ+xqjYXrtNggZHFJynrgqTPfO1YMK3aKvKtG7jeQCs
         So/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763698269; x=1764303069;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjpEL9kGKVSSVdpjErV7YwcfYr23Zpd6aDPt2NCvETg=;
        b=NlXlcMm2s9QfW6xuEqXq3+Bxpoji3NXnLzgvZX7cs06RtEzOo/1AEoNcw5Xfy6S+nJ
         BhaXtJkIRpQKmxwUJNWn6C/JuM18BSj2XErKQB6oDmS0GhAK60nDvrx4n+Yl1rVjzZgP
         VvYeUFu6niHyzBxsbiEoZkZ63IVTWjrgAdRfYIR7v4L/Eh9pVkbcdfn7/iIhAr9MUdQT
         VCFLtcYAvNW5RV3t76loLdwr50qkraWW1xKFlxD0rbdS5p7tI6KmgoajHHwinQ3pIJEF
         EUQOenXoiv+X5vYDCprGi9RAJ3x7xskjyC9X/P7L8ixR2Lta8xrDKre1vSzlk+kx4Y9i
         skmg==
X-Gm-Message-State: AOJu0Yz5rSDM46FUY7//hgcn4//WkKH0nSvwF8vvFa9mQvS/+Czg1WAm
	nDPpUeFeOTwAIduUKgET3f0N/1DBxShq8BEsyS5i65xMW43R0g51dFNVHNLxry4A8FMNwwXmYR6
	01Y1JxIAmfAXK9o5xl1zsjnC8edmXbypvoL0cFKF2yRv9f0vMF5K/Au0SGTo+Wz3iOu0HBvg=
X-Gm-Gg: ASbGncvHUmiefXstx24N8Uk9g6gwp+V219nYX3+RkRlkYt1DxhyKJdCJbjukkrCIYH3
	vO+RwdtH5PKDUbP5FHCMLeHeGTVewm3VDnuuyOvRYs1RjmFVZj9pCDkIFkIEe2tUGsKhFPznAJL
	R70ZFZ82eZx7VN3j/vUug7GqLm6LwX2uaEaaMrorxGO7j101/mJq84dD9q8URmA/ge/dlUhX8d7
	ebmi0MfWnE2MhITVcLHxLz9C2QqO8Lmmqxv/WddKYdmakbZfqpfrfwMBGl4VGG3GFFramErCG+e
	XAjpwvLwo9jqLWFDAvluYWxafSBAufZrWE+tQDifJeTTfWkPSCg+0ILqXPXaZb2jHwxSYNWw9aO
	fFvCqs9Wlq63doOnoaV3tweVU6AIKEn2BmOSWoilGs605b0elRZL5xfRoJbE2Na+rKthXASYpoM
	4ZNgXvWw==
X-Received: by 2002:a05:6a21:3392:b0:35d:8881:e6ba with SMTP id adf61e73a8af0-3614ee3889dmr1621039637.49.1763698269171;
        Thu, 20 Nov 2025 20:11:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHlq16soRwr24CNkpdE9S0KV1dvYGRY3jvhk7+5BoOyxek3WHdF8V6d5lHxKbhqeRhISpSKw==
X-Received: by 2002:a05:6a21:3392:b0:35d:8881:e6ba with SMTP id adf61e73a8af0-3614ee3889dmr1621007637.49.1763698268680;
        Thu, 20 Nov 2025 20:11:08 -0800 (PST)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed47b388sm4420594b3a.27.2025.11.20.20.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 20:11:08 -0800 (PST)
Message-ID: <12237382-ae28-45d8-9da1-af700cc22baf@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 12:11:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: update firmware binary for v5.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691fe65e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=HqihI7LvRe4Hhu8zyeYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Tzk7XqDvJwcPA8TlnM72TAU9KS6yvX64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAzMCBTYWx0ZWRfX5+DBpQcTXulf
 3fBFJ8+xNz11jcuZp1ZD8YhfJEOtdpUYA+5AGCP/8+IdjP05JPrCrqxd1OYl7pRycBbG0lj/2LD
 WO71NR4wddAo3iPLTSo4WMIAfDESghU/gCgSHd5RzX4aJrg3go6Qw3CZJgJc6TLEAgKEvqkU3ou
 gUNQKHbUTiuJ7RU0PhbXWnwy6cahboygJKvnR3keipNMdFb5p2FMTbSPv94OKdmhYOLnVkHyCQ5
 tt/J3sfXJBgzwmGZVjXYO1m+vvInmacE3lPAkAhX7dOlMnvvFQhQqndP1lKoq9UngqBAqbLAs0f
 u3wc0/TP9OtT2zK7fnakDylTbj0jmMOE6asVut4cCJqi0B99I/HZtxJZE0yvCTP51JzBotpNH+4
 ICR83ZVS03tXnyDtbo0zyYtWDft3Ag==
X-Proofpoint-GUID: Tzk7XqDvJwcPA8TlnM72TAU9KS6yvX64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210030

Hi

The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:

   Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 
12:02:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
update-video-fw-v5.4

for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:

   qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41 
+0530)

----------------------------------------------------------------
Renjiang Han (2):
       qcom: venus-5.4: remove unused firmware file
       qcom: venus-5.4: update firmware binary for v5.4

  WHENCE                      |   6 +-----
  qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
  qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
  3 files changed, 1 insertion(+), 5 deletions(-)
  delete mode 100644 qcom/venus-5.4/venus_s2.mbn

-- 
Best regards,
Renjiang Han

