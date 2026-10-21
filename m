Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C612606A323
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs3t97fv
Received: by smtp.kernel.org (Postfix)
	id 77E191F000C7; Wed, 21 Oct 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792600222;
	b=cgFs5eV5rwUJj+B2SsyHwZNQSwQvcDuWW7qjWQkqsr4ZL7HgAoz4HG8xye8uwZfLIPPw
	 XiR6WoiJO0Ndi46yrZlw+BPCFOH2RfB1nNnCyqzhL0auWduqioWR6JF7o+CqlpiIyTLuU
	 JX5doztFmhQMBDCYX1RvYgZUQKCqVDfvqWbklG+avhneEsIHXgUhEtAy1zdRyUtss7Qpn
	 rmtLca4uKFSQi+M0tchXb1JzYXZHFLmv5F/0v9ohMi6F91ygXPTsNR5PNRBcJDMLxB81K
	 4wz4/JNeoNFbgfTDH5eCXUrcYKoFUpZpNOJ2Q8/MgXJPopWBfYdfqnBeBst/yruvWnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792600222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
	b=gGiHXf3V4Khmd0bbm+0un9PxJKUvcIGZhI833XbPJcCE7/xy3tDl8USX2Q8qtx1wIg9C
	 VOt78Sc+5Z7gUdnsGZOZMb1/6m1enBEnB9XOWKacUP8Y51TyaOIQM1dB7nja7KeKjSTAH
	 VHqD/VAIEkTOCf8DR63FW6nJWH+0GY599VGfDPncx2WFaNQbJ14kKybpKY+o2fUR/fZcV
	 h4NSn+vXhcIZtTUV3QgDkd07EJitOzvvuABKLjUohLfMXUcn4l8BnksX3dC9j8ixNFeIa
	 AiIUlvfvY9YmnIdjM96qLS16v9+WqHmoZRRuIhO9pDLViaZ1lpLcxCkZ4rv+ImITpRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs3t97fv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B247C1F000C1
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:30:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs3t97fv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B247C1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3QD2900412
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tlGZKGlDFlSxsOTfMCF1bM
	EShPw4Brtj/kvvPvd5sbU=; b=k9kKQk30PUdLl8ArJ8roU9rVGZsUL1RO7QsJ6g
	ibh9aMHMuoBPsgbxArYJ27WZ9Lqa7wCmj5wPMERpZGXfdC6IUW/NWKFO17jieEz5
	sI0n6UQfSz9gN0jsOwLkNk8za2ylYUkFD3CCu8grAojXmaAmK3TgUZ1/QUZNLoOL
	vP6euYLIeP+f3mNiN4oDMxJiEvkOgq49Uz1jQ86ScJLBXifSDnpJZXJ7ZvlpXLFD
	3KDt6Hw8Ckg+rOpOn6KqBV8+Rnbr7K2rws0Ga73hVFuRiboaMVf0UNgySz/LUf0h
	YFb4WvFf6KFfLhEOnKTbiKb9+Pi/O2aiJEa9Tp2Vc6KJVnkw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2g4ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 16:30:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd634ac49baso5779a12.1
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600219; x=1793205019; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=Fs3t97fv8J0RTKQvpwsb1pk3Fy0MMK5NcMcrUep0FsFZh8mtSzrtsIp7Ip9EC1pjnp
         +Q2HPB39vSRPurjidyFbKRab3G6RDlKnJgMWoMXmkjaxmcT+fzfwhMv94vfTuXL28PJG
         Ww5/u6P6dFt/hm4DIevqzTe6Qg8yn7Kw3ZU1z8bTcIlmOe01DLtJrCTk/LV11T/OPQRv
         pbNKdcMMhGRo90OHxYJTzZdKJfiYnnaxcEt38zwvs6EWKKcKcZ3Bl/B9CleRtbYdlzc3
         oq9oeSb5VdBOQ+SLZkFuxpnoHSnPn6dXZGV8/1q5Nq41ZrEC/f9OsXwZCxeLh8o+25YV
         Ppyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600219; x=1793205019;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=XsP4SPZijPVDIfLAnesUJjmZJstuP/Ivn5+vbyHQ2lPrm9lw5WpzFIhP7Yto2QFnND
         D1pH7MpID0BcOV5QI2qc5QixfuGXT7JcXdUdhNVqwFLYlBsw+RnYG0PD9BKXzpZEuFPY
         Nm8xh7/mFORbfnmzTjZHVWqMKL2laTD2u7RmbXNmdRYez8SpM9sd2qDVnJlU8dUoV19W
         SDY8xIbLsfm5MBAUSeq4XKvaiQRxGVJHUUTCq2l5Pc/gMz1IvouOKSl1TU75kt+oXyP7
         fdlED0r2FlTl0EolS+lsSEVL6zgsJpnP6GkQvLVABYW9zBEp4V7fK1ZbI95NdA2A/Bae
         SUCw==
X-Gm-Message-State: AFq9FYJqZKhN+R8F1N/bUdxXCPU4nXeBJl3bQ21lNQBy68RihSZPZjug
	5M3je6DC68wb9HFBagibFxf0PMvy6ivbzqm7ED5KQ6RSaxYdfEq1TmsmVDMxyAaUPzqzO8exa+f
	KOONpwXFKap7qK8ruRVN/ppSD6gOIn37tWk6sD2L8Qbqk9SJ+0eq7ICQvzgm7dUIJnnHiqiU=
X-Gm-Gg: AYBFou2D5Y+r4+1FabjhBMk7LKWr2SkHE0P1vDsmiakn2HqD3fUZFrkPtDideOAaFUp
	s8ToHEDfleSh6Cg2VP9+/0lDfTzXHe7hkYfR53/3OIspm1MZnxsRUK3cOl6ZVJbNJ9pwOwlsp1Y
	SWd3oL+BYwgcIIY7yoZzH3qG46+sTxCYcI1Xz5vyTqs+jwDhDEsMoMWB819pPI0Nb2h0Ig2BIxI
	ps82VxGFAsoZ2CHCyDKMkTDOBDb7rzXUlf8MeOdPlMtxHPxFXK0z7xvxmr+t5Fz1zhnzN2Zwmoa
	r0IpikhDpG8Xau8Y6K4+7g9EnbNXA7HdUPv25rfJE93xiuASZ8XGL3DAhRnr//D1ptm0rVCXZPs
	bqTeJxwdX6f2J35BkiS5kdCO2Ti+pR1hLcdEA
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499979a91.3.1792600219335;
        Wed, 21 Oct 2026 09:30:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499969a91.3.1792600218678;
        Wed, 21 Oct 2026 09:30:18 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm157338a91.17.2026.10.21.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:30:17 -0700 (PDT)
Message-ID: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:30:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261021
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX7AkYMoLUA+YV
 3HRAov6t6gCcWr3Kq0wLye7dBbkgYVvMLMJJt+S5PJY78yvt1PAcMb9DhuntxwsFxVTUFibkiIl
 6BL6bK7yqo7ksWXz4xICw30eOeTiwAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX0XVMRdlNEaZy
 YpFIX/bnklxFOQT66wXMk7kT87Fa15scHQgvrepg8Vgs0tb8eSJweyzPfKJ7f/ykb9mY3QZ8Zl4
 rzSub8F5hbYGxQXDfgaBv1/OrQM/tWhUMQxuA8UFHDvcI/lc/C4nAR9YEj6fspNpLEMRnLJO0E+
 cV9aOlQtYKUZ/WORLFEijSNdFM7J/mou3ff1/r7U31BxFcpmMRcNdJi0lKRbS4xtGFfwWEIonfO
 iJnBBXFjSg0Vid3oOlAKmMl9YwEXniZoF5Ckc/8pKVIDGg4sOy/xVC9iY5LeADuVdaQ6DqVJSqZ
 aAM7kRfY5K+VLvqrl/QHzYAjCVLIAdDrMkC9vLYflZgWHLJVWWsvtiKVAPtg5Or0nJTJneyza3p
 MTKly5gPrRJRxhgKqStphEfWLcO4IB8hG9nqFKb4qmrib++juEzHToczu383fUpcm6naxmbUXnd
 Udb6XY+rwruKDfbhk3Q==
X-Proofpoint-ORIG-GUID: Y3EV7hpulxK1VzOC8_gONZ9tene2TNx2
X-Proofpoint-GUID: Y3EV7hpulxK1VzOC8_gONZ9tene2TNx2
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8e89c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210065
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 59f9fc2ef8d1e312d2a613d4e1ffad2ff31a0a01:

  Merge branch 'qcom-fw-version-qca-path' into 'main' (2026-10-21 14:46:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261021

for you to fetch changes up to 0c5fbfd280e21e243f5956a0823cdf958839ebe3:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-21 09:16:32 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
