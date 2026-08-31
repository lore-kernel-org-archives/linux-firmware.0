Return-Path: <SRS0=Qzch=GY=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD7C61DD3
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 18:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 077191F000E9; Mon, 31 Aug 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788202179;
	b=MH0dmXL3PWZZSCFMF7x51zJUl9DiH8sAtzkRGLgPN+ARpSupTX6nXxY/qMM1d1dIIJTG
	 OtLHGqc2yycSJyj3YaCmCo8TK36+u+5IkiQw96RIrtycuBPaHmIPwzXx2WOHcnMfMdoDk
	 jpFPgNzLzDnWyIlQRFzbZ3zywp6vRvu6mG6KfLmDXYgqVbyusR8iKmIcyfjkd/hH7OLnj
	 0eWzu4DiBxLCDS3Q+xPy1WOyVujPhtxSBq7k85ZIE74DLpn63RTREzoL9d/S40bv3m/M1
	 sx+aOYYMN/M9s//tSeKOiLG3cGj8ETl/UzWsqjewXzvPebUC3eSbr7/MGrHCMpoZslA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788202179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
	b=SoUlUZKTMi4yA8SBOzxmht++uYdRCZaQ5wyYL1s9YDY779UT4mIS4wG89c3b9WygQU3L
	 JA5MFWcmgfLu4agPnPoJQV/FuhYtIut0EehaZcAVHjaD9mJ+fghtEdpZgBc7/G3Qn9rIB
	 vTv4VP1x1AL92NM5aOAArHw9wV54jMa+hPrV3DpOQ77Fm4TianTDyYzPfuK4C+5sQhrS6
	 UT22jzb26Z48BjDu1lPA0YKLhprjaGX0d1AJ8r5UTfn6o+addsrFLbQ0xHQVGbnCDddIv
	 FZ0g98pTlnpo3GYP8VCXn9qVw152spE1cnAbl5WlHUOKwecY1b9gYW7h1TUTnVAS8vQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoaCRXvP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMqEUGkm;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED731F00A3D
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoaCRXvP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMqEUGkm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6ED731F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIY33p3772684
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 18:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHW3hkiKEKh+3lY2MSqr0
	2obqLy+h9PcFgQfJDAbMA=; b=YoaCRXvPl7KaDCHPA/qHOt0UcWyYenPzyXi8Wc
	3y8z5ARu+VNYlcdCpPy8xMrMYnaN6gDHEjv0WmHOLNn3SVPKb1cCR+yxf2Tjukeb
	PiW8D0hAAt6N4rGCenhd4KPwNv0YpG3jB1o5BLLse8Qjh5z8QdUWvyQufvGhUpga
	o67WBhKyTeMAtr08pMHLrpapkNGyf+aqyHEMjlhzw+CsVrtPJdKvKn9o0LRsBZMJ
	BJcYap+dSdswlDeyJ4SaaVyxpDRnPK5CmuQgbyjNf5fFWJi1OzVhuzTjc4WlrR5w
	uDruHSUnefLr/vp+SLCBa4eenRgTAMetInoVof5ARSskZSOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vctk7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 18:49:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso91656a91.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788202178; x=1788806978; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=YMqEUGkm5jyCnjBeTOQiTmFa4X6zeJpPB2wNLf7sJVf36EGger9ktVLeade9Z7CBxL
         C7r0DMHaUBimRQtYf8y4/Mw8WYn2pCK+6yk6JgqSo3zvnHdEK3Gv8OjW0y8VPON+BDs1
         AfjNovGI0MoCPy94bGbjpmknwrFvyK1Qwme9Ei84mbRRejc4paoYs7m1Pk7EKDwClp3e
         GTKVhjQAg5TItAOrOLJiEyHpYjAYMNSyyoSmH81rYd7bl+tB8jrwcizPhd4YfK5clQbE
         czgXKSylT0garbBe7Ms/vbOy3TDG5YCwE6pkVHysg/4C4sPRIdOHo6QmLzScaXYRq4tY
         ziBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202178; x=1788806978;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=LpKRNlsBo4Pmsp8Zs59PlFRxA/touxqqY9iDskkQ/AhwpauQLTiXP81x+U0t5wGgc6
         t4pLcCM5BhAifm8TCLZs6gjvGOqh3l//MeU2Wxc87gNu/9x8bc8RDrS/+S+mfg/Ics0Z
         CdkjhU9ggmwvlK7CRTqKrvkoLQUlFMQ5gcX0e27mjqiSarf66unJHH5pvRC0ZqbRt7cP
         S9+lDxBNFQmYa5u9mv0DT/23t0Fj17+avQe0gvuD0aPpxrASv3jWQ8tXKNpv5Nr2X5EP
         BQeV738IghhGyCesZlFdKCnOu51BOR+LcbhAJAy3T4xGH/GAFYAHWeY3jXoC7IlM3/sM
         Nmhg==
X-Gm-Message-State: AFuF++mXHabeOKu+34hmy+Wzkq0vdO00+aqanjcfJXc1zS6lZ3+/141M
	tlblqh7RarFlFVXzppArMk4XlMPghFFCZ0lRzQmGd1Lvi1kesHRc5wObx2/6oP0qIQdolt9EQCD
	MV9X6HM4s2XkjiVAlR+H4F6bcqnrouU4wTCGKA8DPGsML5HjJrH8ssgMfU6I4rA9w5i/DFN8=
X-Gm-Gg: AYBFou2i4cm4AS1eIljE/WstjsEpnET+qDKrxVMhgWkkftaWNaZYYnmTBYKE1QKZnK2
	D5n/5LvopWzSt0rdvrbHwuquF8aaZYKyVulZL/W4YewpvpPp8xgPxK+8S4RmS7E4+2L/zMcru15
	opJPcqsIpvwMcfa/F6nsFIhVHvVPcOhMCgAUv/BOvN8ma0AAhXI68W6c5YsIKN5XddBWH0dxLuY
	AZ7nT920sr/WRGYal7y3pRQCsNIA5VSHZhURSvNcY1ZTaPTvzCDr5/BcdmIPrlfDIFPn/JIzQ6B
	Hqgf3SkeqYJycK4lzt2u1o+M1XJmUCPDV64OJ26lZnCuEIftWshb8TMr8+2EulAxLrs/bjdXajX
	gQRVdfS8rIb90KIr95/sxa9rsxrnNepGMeVVD
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742487a91.11.1788202177902;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742416a91.11.1788202177338;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm44942268c88.0.2026.08.31.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:49:36 -0700 (PDT)
Message-ID: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260831
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfX7JnaFBEnv91i
 wW3UVRHcEtZ6/iqHQiuoZulqL2nXqyDTW2QWBHK32ipDwtMlk2BILQIkhfhM7TzMthm9R39mK32
 viWtkJ/zutlB47+p1g6BrKpjh9t8Oz4xboKTbs26sgO9oXIfUm0yubPTsV1fUYP3VjCtqgiDzWB
 5UjSqPhR5OYwyMHTtWBq+/Q8NA9HhcogR3pr4+yfVPcbcvdRJRdCZheLCmmm3gqsAr7qMwnILh0
 ZoHcZ7dyNQAkgeydTXpi4Cd9UGy1rhEjzVhhY63cL1PsguRK247LnfZA+QnUoHeEk1d2Ik8w7Sp
 FYyds09Cx1aGh88cBv2CBvPo0lxVRBjUWSRE6YLDWKUdeQzwqqrSAPctMHwNerpYh6wgw1USC80
 SdA2cN2CUR6lx8Twio8TeQ8s2mDkRzlJIbj8p1k9HlgKPSz9TQQPPp9mejHuEVNz1u8HX4wDcnB
 AKTiacvQNEfUgjx8WdQ==
X-Proofpoint-GUID: 3TA1aHqlLPIBfEojxpPltzb5xVI-2iuR
X-Proofpoint-ORIG-GUID: 3TA1aHqlLPIBfEojxpPltzb5xVI-2iuR
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a95ccc2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfX4EM9S7AnbROJ
 99Xs8c32+xt9Fh1dtYAyfx6FNLtHErY7wMKiqyV1Kx9g2A8S5YyDnp9i3Mpgd1ZcJDe3WHXDjag
 EuIUv9Y1CSEfbLhjk/BenRkSD/qOJPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310162

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
This version enables Multi-link Operation (MLO).

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260831

for you to fetch changes up to 59005d7898134a2898c5a17f37a9f629a3bc6807:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-08-31 11:44:42 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7148724 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
