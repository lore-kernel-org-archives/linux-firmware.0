Return-Path: <SRS0=8xIo=DR=oss.qualcomm.com=wangao.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC871CD4F3C
	for <linux-firmware@archiver.kernel.org>; Wed, 20 May 2026 08:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD2611F00894; Wed, 20 May 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779266741;
	b=rw1kqyalW4qmTjJGXDqq3uFEeWKteGeVNs2YfMHy30RNFmbNzhpyorDmjUZ1hH4tjQk/
	 r/dBVKUb5Tinm0wCE4YCuxWuyqOLGOhgboc8vIqAOHGrXzytbF2ja8k6oVbCjQ93G4nzJ
	 z4RLVBRZ7Mxgg3eMH1yf0wJOo6qNTnkzJWgc5sKzM/Qs1vW/4C6XiJmVQnwZ/ug+ajo8X
	 k6XEw2de72TK4SNGyxuudO12g8ITZinT5k+i/MbxfhCp42WkjGDXu1Oar7aDDe+4FFnDe
	 d6fzVxk+TsAZ5PHTq3kGdViuuZt9WqbCOS/o8eJBztLiN0yFpTxwkV+YLYnhWTf0ErA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779266741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:List-Id:To:Cc:Content-Language:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SqM4sJVQl31bK2u3th9Z+ckZ1JP6xQ+CbYzFFDLoA0w=;
	b=c4zcxjcMp9Kt4KcquQaAPB82g+K7vMTjN13/NXXoO0p9W30j54GzkKwPE90+SL16C7NC
	 2rCldkThJFqgCGcccB9zzeSQlrMcA9dWb4zkePhzNZICvKZ6eQSr5kXfayhJN7ZJCMl+W
	 Mb0ixEdAyYsx1sOuHo5zaI2nTWB0BHrTnaQPm4ldCnTsdnFBLZGGYSdS1Sjb2SHLlop7F
	 and91a1YYBlk8+SB+Q8Nh5rCa6DNAmp/maItO2EgSlmMRPhaYhxX9XFqenp35pXZF33j7
	 9qx5a9jhSGlCMIBcLjaLoUl0Tob74/1SmQDAXNWU19ZdUmU3/lNG66+tvCuAwm/4XHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X7J4q2N/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4oAJPl8;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AFAA1F000E9
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X7J4q2N/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4oAJPl8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2AFAA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K719dm2984348
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SqM4sJVQl31bK2u3th9Z+c
	kZ1JP6xQ+CbYzFFDLoA0w=; b=X7J4q2N/b4d7BBg/0gPsqqKXNY0CysvwLWzwT8
	eY26B2LUH2izlbSW/97HT7woC/yiUOHFdZx1nWQO/BskFW2R+ghhI+WLxiEgH7nY
	QceuS8uq3BZjrMFvfv2BfeYyLZsX8rdx5Ms2ylwpA4UeWnXaa2HxeqbEthJILoqq
	mZtzettDyR6d7u7AU+INCbko8/kdjXgt5q7rJt+rzHzbUlGdcCWQJ1zUhi90xIgw
	gYy6BWtjX3cQEIcCn9jd2D0A8zc81hfsYeHNsO75NLWY0WukvYLKNHlolCfMzAvc
	5XFDihhrxvOSD+EhS1zNYkY+v4hQCHcw5D/SbuVY5ihIoVKA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3xmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 20 May 2026 08:45:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so4199730a91.2
        for <linux-firmware@kernel.org>; Wed, 20 May 2026 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266739; x=1779871539; darn=kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqM4sJVQl31bK2u3th9Z+ckZ1JP6xQ+CbYzFFDLoA0w=;
        b=g4oAJPl8dg0PLIDjWoDJsG632A+PIg+KC+rRjqgtIMeUNw1ySyEbPJjmAhECP1U+eN
         oMsqyPGMRiUgv4zxk5Sndw6gxSbhE+TDwDv4bMg6bG+HNd0krkg4iK5Ji2i4Lsi7XpnP
         atTXuIDGW3Lb/HXKXCc2KBkCByqclocoAAKv1+F4cSel7e1CGKxnQtl4UCGV588jJ4Yf
         QiURN2tmuCg6h7pQXOdM0ni49lO3V1z+CLOCNkVCbyvZNt+VBYuwUzW1tQFS1i0uvEqe
         eQ4dZh/jXrC+kVEk2rvyldb1Q4zGq1u96Kj/G0YgbYiybdIxiA2HY7dSaqMGgmV1hfBe
         GYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266739; x=1779871539;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqM4sJVQl31bK2u3th9Z+ckZ1JP6xQ+CbYzFFDLoA0w=;
        b=IQU0R0JLfcS0zxMo7atxeo9uVT9DWswi+9buN0BdTS8iwRTsak8sQIHbNo0OoK85do
         GYBsfGZVQ3S8D4sGTVcTrh2CyNmNBBadtAGN1Ya8u0Jmsgx+VYv1Bs5HY/4d2kYArHJN
         J37x5Iq87nq3bIzHxwme0CmeQuydWZ496hBfuns6tEUThsIX06nnUokGH/u8b5vDv7VK
         oMeywLJwk1KVx/yI0gNNGAg35GL5LdY6ZjyR87TIO1xqcGYcD4RXRhV9oB2f9jpiAHYa
         ijrb8/chVJl03JKyDlsCEpmtZL+Kd+b2ZET91qBheRQDQWB+JpPcfzZe19gQ25tx7GS2
         6FgA==
X-Gm-Message-State: AOJu0YxeNoGSvBd9+FDCU60xy9ykN+fygUlKZKjmyCCcvaKNhLpdt9x/
	TG+zBGSItR7VVfN9rNo994h9ZNyMyQRUIpDUVGpIkTXrCCw7qQ6rplsZOQrLZKQHUIJJXXtq097
	kXOjauGbWE54/W3KOZAbrLj4SnLdb3Wd/1H0Uv7K0D9WZ2D7O8hgjGejmuyK1WYsXC9Ev2MoDXg
	==
X-Gm-Gg: Acq92OHsHZwnL4itsnx1PkaQsIHmYkNK+vqswjg7Kk5PiQ2PPx52eT1JndcjacRicq2
	T5DgiXki70u5pwe8QxH2GXhHf8zkcaGZmC40uh2cpacV58/wKav3Kx/fUdnq/+ZgJ3IomzAMqI8
	kSfsUjHeCo1ALhyKtq0f9dSlDu/8bmIOJfWyMBff177O8r8IDY8Yph34YfOlCUChFAT/TKNZvlQ
	jTvp1E92zGqo71nDIgNXzGU/Aem4wFXZoD8kki/Gz/U8XqiEZL3LNZyYZPxW9N+c0UfG7lD5Fn5
	/Dudnqfr4jxHenIIec8GotTQAg+y9xuA8Vjcl4RMpDyjYUyPLdE+f8YkJFpB4Ld+nwaHdpetDw9
	BImG3xxBEz4iIqrDA+3YbJBCDOhsEVNYZpP2KrQ7NGBPFc1/wxoRVJgMh5S18cO9G6409LBmisZ
	lheuJ7FUkKsCgf0i0=
X-Received: by 2002:a17:90b:2fc4:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-36951dcb7a4mr23536100a91.27.1779266739524;
        Wed, 20 May 2026 01:45:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc4:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-36951dcb7a4mr23536074a91.27.1779266739025;
        Wed, 20 May 2026 01:45:39 -0700 (PDT)
Received: from [10.249.9.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517ede97sm18549767a91.16.2026.05.20.01.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:45:38 -0700 (PDT)
Message-ID: <45890930-775a-46cb-85e5-ffaadafd829a@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:45:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: qcom: vpu: add Gen2 firmware binary for Purwa
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d74b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=SdkRTHixgpxaJyZDGqIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 97FcVx8a9LsIb-w8gCGm7UesjNtooleo
X-Proofpoint-GUID: 97FcVx8a9LsIb-w8gCGm7UesjNtooleo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MyBTYWx0ZWRfX83d3jvTlOHwM
 k0Oo4705i3h8wh2Lu69QNaUlkMNmMCPLUSVXGpI3GmNai8kBxDMyg9K6lQo/uBevpZOFZVwS4za
 +FLMyDstgmorcUwj6ogYgEyjKGV4cZcWnYn/kT301XX7DAELkxhnHtOaxyb29YXzAlJ9kqUuiOJ
 Jlf+lgRzYiSNlJ0DYXSZp5Iy8F8i+gdtj88jECu0V1DA9Qqnwy/Jt6QN3UM1AeR+/O5OjQD1XLD
 hLQi3W3lU/1TMSJz6+12PU7IgGX7tV/3lkKEgOrkmA0QHEiCz0So+oo1sUIeoV61frw51a4ptqb
 /jvUAjL5LQKINstW+Neo4oWgkzd9a8IcAQDcEgGA7bCG79WQfPs7f5oF2eI+/ljec8Ax71BciS0
 Dm9zGiPAc51l96ws77bAir2BfWZHZFlvuTlC1r9b8mkY5BedZl4dofhW1LkNFXTM5E4cM8u/Kni
 w09u8BXNS8pX1c5SgVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200083

Hi,

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git

video-fw-Purwa-Gen2 for you to fetch changes up to 060aa3afb83c5f8c8e1f30ad0d9f8a2088718754:

   qcom: vpu: add Gen2 firmware binary for Purwa (2026-05-20 14:43:45 +0800)

----------------------------------------------------------------
Wangao Wang (1):
       qcom: vpu: add Gen2 firmware binary for Purwa

  WHENCE                   |   4 ++++
  qcom/vpu/vpu30_p1_s7.mbn | Bin 0 -> 2323048 bytes
  2 files changed, 4 insertions(+)
  create mode 100644 qcom/vpu/vpu30_p1_s7.mbn

-- 
Best Regards,
Wangao

