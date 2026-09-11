Return-Path: <SRS0=N4dl=HD=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E8C88E4D
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Sep 2026 22:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB0501F00893; Fri, 11 Sep 2026 22:13:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789164798;
	b=QKt/SBh697eXa2yIBhyV3g7hke4UaY4XB26DsVwltuy9grTk+BtlJXUlLEFxii8Gg76d
	 lalFD3aekQuA2UAE5pKcsOb4ggStazxDns28NbxZ6NLc6kb9zai+b3rtNs5Z0X4V8zFow
	 hnO/FY3C2jXE34tMiyMVejoj+1YOiFGtfqFTowG9bJK7GiC3kxWo86m9h5sANqlqLHG4k
	 ngU7p7OQnPE/40NzdYKhI4B+yqOrJKebf+i/a2CYCgQAgDnGvNIc7mAVbfIPNhEOUGero
	 uAKklG7VIEd0SaKPx94l2b+kARtAT3hgCdFI8aKBb0nVY2wWEsEBXsTaqUhoFKJE77g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789164798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
	b=v3KdhnL/iA2oi/vE0CZplpiP9S0eg6KrQZb/IlWwdImeRCcj7q67DGZXyZkzjSBbfs2h
	 4VnltdMhS23vmKpMMlGpaIj2M2ULNOuEQFnNF4Sy2DflbbB3TqNNcC7wc1ruhP8ILqlOd
	 ljG4IOkM+VYBjswVdWKSpepTvBE4DurgDPg2BmezdInAthouEI2yQpyObXBGBJ9Nba2/a
	 vm0/AOSV2ZEW236WbIKBQfHbF+ih+9lr2kEzlZWg7bpP39DuMRpLtTE49JkEJKxBRrrV3
	 ulPlm3d4hSqFC7qrVgNWUKWgs4JFGKqV+9QQ45PCvsAccZHBWwPKF7KVeFhMEGq2nGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GRUeFQm6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HDeD/nFx";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6BB61F000FF
	for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 22:13:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GRUeFQm6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HDeD/nFx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C6BB61F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWNug1738855
	for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYwTxVAwAAEy9xr61JO4H6
	DlThANBCiqbXJNrMjjvpc=; b=GRUeFQm6/+FKi+X3HvnS+qPpR1BJ3t5z+FbdVZ
	AKOn/eTE65GbCG2TRYO8myNf6T+DUPZSKP/F3g23x4Kg3JuDyFVEssqfOqgLuJIf
	mjIn/J+ZLc3nTVeJ7fDzD86NswFg2uIQiao1LuletsNewFYheXRGZSXrn7ZKZpLY
	65mlirpqrnoWxIZpBsBarJB3IM3g+ok3daIDfaa1apwCPo/d2brt5c43zDes64uW
	vFcGhKxHYCOyUlBzgFM1bVHSoXO8rG1VrRCCcCDD671ozhz1UgaVAaPPjCh616pV
	JWATxbaCPTqf1GmUy+LMyxpOY7lYSxKmvG6BzXPUAyFeHfzw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0m0ym0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 22:13:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2637117a91.1
        for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789164796; x=1789769596; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=HDeD/nFx+VU5cz8fHVNQ7NjkDwdGNeRQx6hpSkow3wQ1k1Z6IUXTiMWy9NBhyyv2WS
         FxSZ6V8axkX5wIaFGsGxlkrYZq121Wty8LFKXKIDC4q/4TN4i5iwIv183msq925nYYAh
         JJXoXEvvYJKtpOadkiOl/m2Kmorcid2KMbGZDFd9YLuMa4QjMXV/YVDz4TLkbGz4YQda
         DTV7amAHRaTiIQ9RPckABB9cjwtfaeeOpFi/18h5RuOBAFfpSD1bBzOy0c12RH6RZyjK
         QEnerpP8uC6nJ1OTNlGuWoeIhr/hAhPP01ajw11BcENmrgr9rlxbtFOXr7Ay8UV2iJdL
         CMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164796; x=1789769596;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=g/gwsID6hcTGJEuJyNlB/34s4hFzliMh0RinXI5wMHIvl7p3Y5sMYNDxJYmjipQzgB
         P6PG/3KMk87JzM5aEeI/+DBtQCS3adcmxcutqWed9PVzyXjr9Fqhr5HtmSCQS78IUnlD
         xO0GKUdLM5Zuq8MsSLYYWE0+mthpi37u2akQsKP3x8Gno3gJ2fPDBEj/16NGS64KC6yB
         cK4lzX+CEfFzd9d6JtLKSC4U6Z+s0187ls2TzeSnWGxXowm6x3mg89i1ykomEu1k9Yj0
         mukSUvADWaFCIvQ6MhRa3bNhpKpO0SC6L2OTnkzvVxAAfW306XwwrUdrvVA18iVLYMz0
         1HVQ==
X-Gm-Message-State: AFuF++nT8ZGdQeOKw7udex8BV4FQqwDWd8eqXkY7/9fZ0sfSmmBXc+qI
	wSZvop6kwSBuZQwqGJ+ZhP/bKBQSN7z2EDxbiOf5pPEuqXnzP1la1f2+2XjsMn2CGYyRqDr5dk2
	Upw8WccHaawcLEjd2H8bRaIkN13kckAkwlWZhLFeLgszdYUnjfsJ82+y9YAe9byfhaSkqs2U=
X-Gm-Gg: AYBFou1jnFUQvKvfL+g12wKERvHwQuLeduJl+eXeYhTS2uJ0davlOQXoVnULn0V6PHr
	az57T6uzTmgQa6fWbqRU7FUO23/T23GhMDl1LJXt/YUEcuMSfviJAK8khG6jVZ8CQCBMXduDNQa
	JDIyVbrKFB7WG69QZlvMP3jKjTOAPIOMhYpjNkky/APqYrmTkCdY8nWI4Fg0plEoEIn2n3eGoBm
	bgO5VgJ3IAI/KVKgS0NpFiy+AxgVx1DznMhP7Hgu0Bme3ggSfy1wqACUvtOx1u0/TadnBPZ251U
	bq8QSzH3hm1x66G5083QX/B6soHGgA09sCZvWJEHRkJWbChDzBw03oMYPFbzszpbMiTNAEQS3ak
	HkCr8YoCOa+CAIQSJb6pUmv5RzGeNvRGSzKQQ
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352740a91.23.1789164796289;
        Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352694a91.23.1789164795793;
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm10137893eec.17.2026.09.11.15.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Message-ID: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:13:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260909
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX9P15GI+HopAd
 Oo7J95MUwj5UVqNPfna2o0owMCFfQolKaoBcDyklvqSfgqH+A9cFTSGBZ5j3UjjoLBT8TSDw8hu
 PAnvJXiGJ64nYI75jYxdYB6ZH7OAzbk=
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6aa47cfd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: oKkSKv7p2UXNcNgDwkEOIDi9TaWeUIu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX+0houLHi6oZL
 zgyj692ayLLL1g/m4BV/htDIS6zEMN5IhcWX7TsIS52cockkXWr3Xk4bxD5PzFSRiJGWpdujERc
 moh3mySBSEizUWAoZsC64lG+MgNLqnvztMJyYzd+mm5+W5onqRLtfp3N6dUbYGMJ9lNVwZR39R9
 NUpncnMEGrLF1MGVlHEaEOB3Pyyfv/wIMwUBzro5PBfNPiHX8cangaT+pBMehgzZ8H1lxo8UHu/
 3Lb94Sjc6W9Rg8mSVpsHOPGBnFUvsRBw2Wax5ICbDwcOgwPHAGT+TLzhu/D7fEszowmHGiLJx4e
 Mn6P0IV/FA7GFBSGrdVYaOTsMvJa8258NfUtJVVf7K01tImn5u4GPDk14fp17H6LznuLl5E+KDc
 M1d2TXSU8MmoKyAaZX8yldjfmgmAtvsR1klpAwtDgcakMYqu4S1XmKMEmFiUsjgBpvCMA0XGKTS
 AsjaM5PI8topmgo7yBw==
X-Proofpoint-ORIG-GUID: oKkSKv7p2UXNcNgDwkEOIDi9TaWeUIu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110315

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k add firmware files for the shikra platform using WCN3990.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260909

for you to fetch changes up to 46c028dc5c8e8a75c70987b9b4388ab6133d1012:

  ath10k: WCN3990: hw1.0: add shikra firmware files (2026-09-09 09:52:41 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: add shikra firmware files

 WHENCE                                          |   4 +
 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin      | Bin 0 -> 60 bytes
 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp | 571 ++++++++++++++++++++++++
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn        | Bin 0 -> 3811820 bytes
 4 files changed, 575 insertions(+)
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
