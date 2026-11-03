Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9A606A330
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Nov 2026 03:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbq7Dx0X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK1RD+Dc
Received: by smtp.kernel.org (Postfix)
	id 872FA1F00919; Tue,  3 Nov 2026 03:45:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793677548;
	b=MnFdmke3XGcY+KasHyrvzRrZ5MLz0CMAzgtDczWYY9rI3293MSed1jcceKycGHW2ZuMh
	 0zl8LObiY9jDABIb1szIelP0/kHODoEN9oW04MCrp+JplIX2iNehs2h5NTL3OFMCVAJCV
	 BG25rM6IwtmxWm/9+R56ZDG1CCn2MN+YA4w131eUfydcgjUB7W1qhmHthq2+3tVB9k+eg
	 rOzWhEsAqLJTcJxkeG1qwN5DtD2818PINjnvUQX24l2u4wt+OwgSk1TWWymjmWwTgvyCL
	 4sR2ZsUKNW/XSjG4ylU0HCtVp6VtWVKfyyDfShMX+ergkgN3uXZjHA0xc7diYXoFrCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793677548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c7eNf8ceGv6YVLdI6Xr1AACs8VvJFUcF9OvkRfcFmfo=;
	b=FJ4OVi2gEPNLyLJmxNxPNsRyzbNV46Dx2T1CLBxUnAppD9ODQUb8LuAh4UxMfuXi4eqS
	 J2wjCsWlhu5s+UgOSFAQa5Q0nfdv+hkQavd3CN9S50+lCBs8EdZiHZOm1XtzY9xcfRRc6
	 pjiYtuLvjd4+28C4P2MnqRg8w4zNMl0ME1Zez7GrOjJnnlBKyH4of39X5i0c5zGucMd2O
	 9uTW9oSctHDq8C7tT60GCTtrk9oimSE98YreSsnIzR0ELWFAL/gcwbqYDHHWnVqSeOLvh
	 Icvw+zGklFccaAbEAJGzpVJVGpNDoI9HCIR3yYscFMVfeNGN/afbDIhJlhhQk7gyaKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbq7Dx0X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK1RD+Dc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C03041F000C1
	for <linux-firmware@kernel.org>; Tue,  3 Nov 2026 03:45:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbq7Dx0X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK1RD+Dc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C03041F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32Buen2106691
	for <linux-firmware@kernel.org>; Tue, 3 Nov 2026 03:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c7eNf8ceGv6YVLdI6Xr1AA
	Cs8VvJFUcF9OvkRfcFmfo=; b=nbq7Dx0Xi7zAIcLQxwAKDL4+POSzvVBj+Y/s0I
	CHzJvwYcLXBBpY7OAdEZ64MoF2Nry8iuPh2X0za/f6tyE35S4QXerJM9QDuPAk3I
	HqCJwI7cP/5faQsCJhtwqwcRduLEE9vHg/Dc7GE5B0aoTxkDaB78vh5YpnvGfPys
	qhnnh9V/GmOnP8Olqq19FVQyv7MuebS6Bhulw40DLMNDKCTqW+IB3nwD/XDq1oey
	IXEXRGRjay3fO54Fq9RXBjDPN3zARgEGqwFc2tHNO4p+4ngTK9ORAYuuNV+AAHbn
	pEonhwQbCS4RW1h9mYl8Sbjje9f+TJ31KSgFeoXhQRo16wQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9896y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 03:45:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea63087d79so34524895ad.3
        for <linux-firmware@kernel.org>; Mon, 02 Nov 2026 19:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793677546; x=1794282346; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7eNf8ceGv6YVLdI6Xr1AACs8VvJFUcF9OvkRfcFmfo=;
        b=UK1RD+Dc8LCnQXvaXcmYJ6so4iQ5sqrtgkQG1Q3k9EOontqjHyCcwv0EtlvHlD7jln
         3ype+6lcEw7sAFMhmfx/U50iG+DNvpyY9fvzlI4+fLKqEniWrg/OsU3+KEOKfz+uUJ3s
         VDglB/wGkFDVCrRlmGFztgQ797qd+mx5radWV75k2ALQqqtaXbgjqwsnu/h+oRWDrOFx
         v90bOcxrwmecYOHLqCMdwgmQkrBomBu/4KrfOvPkQ/SUXKIClB9Zbh0olnmh68EZt7vb
         rhrDgX9Dx5bVJKGY114gaNroIMcpkJIK7L7/D7ZfIOzAaYv/YaLCVeAZIb9lIsLlf9pr
         5pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677546; x=1794282346;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7eNf8ceGv6YVLdI6Xr1AACs8VvJFUcF9OvkRfcFmfo=;
        b=BakyY94CZBMbDX/WEcVfpPWdLAhaWYU5Nd2XAxQ/24hqng92Tf49U5ZCN+YLtQT2/i
         IV2A2XxjpSkeWMzpB9YW3CUUlpky8rO41scxm2oesxT4DQC0pCpuOvao82lZIw75kd68
         xXdUF3L2YgxQ55hEwDkur/ohUZOt6zjdVimBFwupywFa60N7R+Gq2e+NPG+wPIn3Jn+N
         GT4mQrc9WQ1Of8vWvhZrt6r6mCGfWp5xco3WpuxVhm6RGWxlD7I2mhvxvO6zEWBqmCnM
         7JvVJU9Dcmx2cXZzm+U5N0J5ngzm15kXlnFpMTBiWzIvtXctlOo12KOmTtjab7kbG+pg
         idgQ==
X-Gm-Message-State: APuU4Z8cHrVrLUIoqGRM8RPBm+FV2lLFzUWizXb0PUF8t+mE/6iZeZH9
	ZUe2eh3iSglU4ariD9orqYAAxxJT8rsPM9uTu2itLwPyPO4RjVDAM6igJ+lgBorZXmDNVewJcxi
	Hc550i60Qyv00RKCHhiGv77knu+O8MCD9EcAt5PxI4ggA3HX7KMyHR0n+Q7UmCbff81tZvinUcA
	==
X-Gm-Gg: AYBFou1NEdPTP+R38/bLh1lG3I2QnXpvmknnX2laFdfL1Bh8SBxjWLlMt/+bK1Fjcvf
	oSv1NBM7sCYT/fuS4uFD9QE9+s6wgglUjR4RYPhiZMHDfA90jX4X5E3nXBWkTulP7bmAfXuQLec
	nLCXqCFrTax2u0uhQqPyhuQXthbDo4OSyV9/08hv5mBkHsDgtYITCvc/oe12eaDftnVk1yAuu8x
	4h7eIrPS5HWY14V2BaWDgS9+NeHaUB15Qtz3hzKNSEcVSzkoTeGSe6A21Ifw5io4PXEQVNFrz6t
	1NTDGVnRcLVYVEirN124Jj/MPHXjeE2S+RUYvLw28WJU4z0aJWpyCGgB86caYI7MPAzVstRL2l3
	qcHFU7bzLuIqRdViMMR8/8MMaGLWkmgmdLrNHULF5D4oRsUMVnYSfAnPfBZ6tB9gLnZl0ZacQ6+
	4aGTqrYJuReczBVLr+0/Cjh9KnAxOQfImLiqBtgCw=
X-Received: by 2002:a17:90b:4a83:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3ae89747a06mr8749511a91.28.1793677545659;
        Mon, 02 Nov 2026 19:45:45 -0800 (PST)
X-Received: by 2002:a17:90b:4a83:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3ae89747a06mr8749494a91.28.1793677545188;
        Mon, 02 Nov 2026 19:45:45 -0800 (PST)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c72eecasm1961274a91.17.2026.11.02.19.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 19:45:44 -0800 (PST)
Message-ID: <ad028868-62f6-42c4-b325-8bc9d3d9125d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:45:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
From: Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Eliza Linux-firmware: qupv3fw.elf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3pwgKck8dnwlMhOmBdEMSnxjEJTSlFvO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX1+6u+UvKuEdZ
 Ql7aV8RA+GDhpadttAU4BI8bF+KBZ4g7z9OCLNNqKgs7pRmsAZe/v4AAxsutW26UTSohjjEfTeO
 pkh9PpE97+ZeLmKK1dCKtzEp+A5dZKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX9uN5pwaj3Brm
 viactjmuTu2DZDmJENYms/9SvfPWT7PV7aWUWKESNG7X/aV7mI2nLdVNNpz8U55idsCiMWpR1Fa
 Hf6+BGw/iuJ8NeqJmHnt70ECDMs8QFc5SBbyA68WLB3EfQWFMn2lVxbGFJ8RT/kU0fOzqq20wSX
 M6JvoEmPaUO7QqSOao5sQW//IhEwon1TFzqE3rQRIx51RHS041Djq0ntofZyGGRbbSvjAJZArQU
 oJ6bk9fh1JgDV4aHlAqCCrGg7XrEBQRjyiN8n+8W8judTQPfYF2ZPu362xNgaUGus3z7239fI3f
 blJTdXaZ/JB077shu9BAB2fPof128GPKhgfzqIV2Ukn7q00TjeAc4rzbtZ/JLJ2z7NsvvkE5Zir
 Y+KZiXZFFvtJDoXBDykqp3mKuRJkO0IWy457NVMDaZgLVYAfehWfqITVb/GOIRtBrKMDaevFwDl
 ZLEGia+DObMl6nb9J1Q==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae958ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=hKLLAb8E5wPhlUz5lk4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 3pwgKck8dnwlMhOmBdEMSnxjEJTSlFvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030014
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:

   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-eliza-clean

for you to fetch changes up to cbea61892b35d92ae388e8391d12fdaa233102ce:

   qcom: add QUPv3 firmware for eliza (2026-11-03 11:40:58 +0800)

----------------------------------------------------------------
Xueyao An (1):
       qcom: add QUPv3 firmware for eliza

  WHENCE                 |   1 +
  qcom/eliza/qupv3fw.elf | Bin 0 -> 64720 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/eliza/qupv3fw.elf
