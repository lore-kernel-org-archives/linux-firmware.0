Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3839DC00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 12:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B3D0C433C1; Mon, 15 Aug 2022 12:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E711DC433D7
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660568245;
	bh=3kIYLZs1NcbYgg5vWe4NN0fzXCBdgYquNMFxpQgJzK0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=W0lcMBgih950bE1S2moFOl/EL8QPU6h4Fa/RP1J1234vbg2yYiR3SyMrfbKBMoloy
	 Cywk/Ac+a7nLXPrPDGj7wWpEnkVV32+zYs+F7KKQVRc9ooXLWdqq/DOFNJYHGVJw72
	 hICOKKg1jSdRlseuYLSmUk2jUrLCRIQtIwlXIQRpyjQvL7arc/dyXXXBdPVjJR5i8N
	 zBKhOSJk/eKzlKpsCu2AnmBuowafJVOnf3IBCRewIb3D+imJFY2WGTqlWO/mtQ03mU
	 kjhih7KzSJVxahmPQbPuWObklWcr7cdcvVC1XsfwqxMI43TR95azw4a6oe0LwNtaHr
	 9r9uMWZe5hqvg==
Received: by mail-il1-f179.google.com with SMTP id x2so3744668ilp.10
        for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 05:57:25 -0700 (PDT)
X-Gm-Message-State: ACgBeo16TmbH3dCAOzsseieGKc1hRTe6g23cGmuba09nojpr1LTlf+E2
	G0x5/BUkBoMtWxq6gbtunzcv3AmdXSXub6mCutw=
X-Google-Smtp-Source: AA6agR797/rDoySOqZb6nkpCma2uaiiyHvoJ99sxZcA8E1+8zi6eKt7q2uMmv/UdI7gP42bWDGhb7lOHZnSsHs7nviU=
X-Received: by 2002:a92:6903:0:b0:2e5:8f47:22e0 with SMTP id
 e3-20020a926903000000b002e58f4722e0mr3629268ilc.97.1660568245076; Mon, 15 Aug
 2022 05:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220812222201.1737385-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20220812222201.1737385-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Aug 2022 08:57:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4jW2ZiLT0vo0qjFyhMtnQG2oMzYSxHWVV7Zi6DeW_wKQ@mail.gmail.com>
Message-ID: <CA+5PVA4jW2ZiLT0vo0qjFyhMtnQG2oMzYSxHWVV7Zi6DeW_wKQ@mail.gmail.com>
Subject: Re: [linux-firmware][pull request] ice: Update package to 1.3.30.0
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, netdev@vger.kernel.org, 
	Gurucharan <gurucharanx.g@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 12, 2022 at 6:22 PM Tony Nguyen <anthony.l.nguyen@intel.com> wrote:
>
> Update package file and WHENCE entry to 1.3.30.0.
>
> Changes include:
>  - Selectable Tx Scheduler Topology support
>  - Flow Director support on multicast packets
>
> Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> Tested-by: Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
> ---
> The following are changes since commit ad5ae82019480dc1feffb538c118397a40934e62:
>   Merge branch 'main' of https://github.com/suraj714/BT-Upstream
> and are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware dev-queue

Pulled and pushed out.

josh

>
>  WHENCE                                        |   4 ++--
>  .../{ice-1.3.28.0.pkg => ice-1.3.30.0.pkg}    | Bin 684408 -> 692660 bytes
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename intel/ice/ddp/{ice-1.3.28.0.pkg => ice-1.3.30.0.pkg} (97%)
>
> diff --git a/WHENCE b/WHENCE
> index ef43a8242308..011630b2a4cc 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5829,8 +5829,8 @@ Licence: Redistributable. See LICENSE.amlogic_vdec for details.
>
>  Driver: ice - Intel(R) Ethernet Connection E800 Series
>
> -File: intel/ice/ddp/ice-1.3.28.0.pkg
> -Link: intel/ice/ddp/ice.pkg -> ice-1.3.28.0.pkg
> +File: intel/ice/ddp/ice-1.3.30.0.pkg
> +Link: intel/ice/ddp/ice.pkg -> ice-1.3.30.0.pkg
>
>  License: Redistributable. See LICENSE.ice for details
>
> diff --git a/intel/ice/ddp/ice-1.3.28.0.pkg b/intel/ice/ddp/ice-1.3.30.0.pkg
> similarity index 97%
> rename from intel/ice/ddp/ice-1.3.28.0.pkg
> rename to intel/ice/ddp/ice-1.3.30.0.pkg
> index fdef8007694c112c4ded77395f87b4e8575fa144..454a2a6ea1930c0abcce83b1f2bf7a58061fa3b6 100644
> GIT binary patch
> delta 1979
> zcmezINOQ|#Eonvu1_o9jmI2}dAie^`E`|&YHHBOg#q}BGCb~DX8k!n&F-$x^k(r0}
> z+2+}Xxs3IvO~3ADO_LV1x~rJI;4{N{wj07<Ri7BYv_Ahtr=6?jeZj)E3I9~Stxq}-
> z)>L-n>s!CBr%~13v0Vub=fjp&Z!VaUJO40OqTavyXJ5}A)15zS_O$<rNlEw1Ro*b=
> zJzjJzdc*l|+wRSOb9alu0?|_k1Xy@Hp7+i-I$6_xp?coNJtp-@_wW4sbXUM=&cv?!
> zU-pUKI(7Ejw)HD-p4`gxpY8IkQ1^99Ug}@}GmEWYZ{3&6#z&{m50n1!eI0ky581F!
> zwHmpJmEOMTC-0y8wzM;M_N~j&W;ecV&M5t1;Li0&M9^iL+h&!W({s{{+OnOFbl%WT
> zv7hnTy7B7#n6oc@J>NZBShw2fnI15hP(V*zV~poZovyPjnM+>J{<W^y>b6MXJhlRf
> zM-k1_wY)i}H-<9jY&Wpt^kCoIz|zAy*+Ec1!AfNM?l($nx~i_&JC^;FG&RY6_)dDZ
> zv2c>n7LVE1`G%Vd1P`z&IPAQ}>91nZxAu3V%1NWb`k%TUMN4k|DsoRLag&KFnz}ha
> z!hu=g`k8+%{C2aZdu)1>=->G3i0N|crz+ROd}k_Z>|A4a)n)SrX`rh0&S%@(&ADFA
> zU*6R7%enU6{#DYqg}Bbid|CXCYeUNC?#%-79YUk=JQCvBNN96aqB~PPI2p4turo3=
> zI7Dnnx|(KMEvBpO;0Y=j7#zB>iy!F0F7D8eLmY=W4&82~YQV03vR|6m<T)wwAn!mN
> z-EeD7+WAGPtQwkN9|8%8qcO!Hj>aMmb~I_?It&fOYuKEYYQV@O$1u@Hrg=+R`<66D
> zAZFUWC5>63Z2FFe%oDa>xx@T{dHRG6j4JIF51F@DJY<PkjVUvcb$i7`w$@cl85z_6
> zTeCX>>Fv%o?B-vWS2=PBEUz-;5ZGQ7$RWhZXf?ezio=o7di(h(j=lUy+$;{&;OT`|
> zIc&EZ?&G-3$l@6gW;R{%HizYQ#{(Rejly5}l^GZsL>SiassQN&yhco>+j|{37xQf2
> z;>XFs$jGsMuRrHf#_4T=oIN1-@=dP@<P_L062$4pKfNyzA}A)x#NfgKGC+iZg;^Cy
> zOE7D(a&MPR;*95?3@jG6R}^wGB}m`kvjob?FihdH0@53}rZHIqX%F5$M$PS0FLHKs
> zZeMbn^9n0aM+-1WIFGZk`}n(iIy?GI7kt5KIB^2&_L}FMe>%k#fRPSL#uh+^r?aa<
> zP-$LCW^U?ae?!@NCa_!ug8-1`VaQ^TWHe@oROV3NP;dZ31|<*+1phMv0TT;{fCAYx
> z&<)7&KL~7R=in^l1XcwiY=VpoJ|Jf{@Gv+qFfqt8C`>Oj;t=IZU=Rhm4a~pi#38eJ
> MiOCfnpoRxb0GjpPJpcdz
>
> delta 1892
> zcmdn8SnJ0lO>ssB1_l-&mH^@$Aie;^4u%X9rS%zQCVDrsnwxPk{GWJvBC{~p)6Me@
> za~bPzF1NkA%+IjYcE`&75nQ5C9z4;UR+GzPqqn|R=AQaFo%!>LCnkruycW0L7GAEf
> zeVg|7do!xudTi0Ub@Sb)zC(*<t(Fj&_hR-Z9u^-Jsg+$Su7xH$YZf=u=httlHrKAs
> zv@_hjQfI+7uUy9^5zmXgvTF+BOE+pQ-G9D4y5vF6?RrIrvra+>A3Tlyd)-ICX7(8u
> zy|c6QxLH5U+|7EmLHwBW%Lz@bNpjaC&R<Gx2yA_R?ql^CtBLouS8Lw8k<^r(d~SVc
> ztkRisp>Uo6ix%SrMG@6ai5q6j(W$jM;o?0r*mb7vhFy!=nr1CFeLQ#d>h_I%Welc;
> zFC3IqPHkWOyy&c^5lbd8h){s}$wU2xzS*<1mp<Ioc6-)&>+)4a>ko5kerUFIdoGZ?
> zWO}1MbI#@hmM1(49{fLk`&7JLac?hkuVV21<a-}N_jTUQd0MqIU&p5LJlp0qjtAHj
> zej3EH7Yioe+cr1Q?G>-HtLVIfQ#bc***Wij>|L!Fwpp8dJRF!6jMtplK1sPVgW;Qq
> ztY4~q!`Xx*BJP_ESk~=$H}Upg{<6()yn(82=3S89@$};7gj=!_`ELRo#Va)LIT@%%
> z80B+qu|3yxW3!LHk<er}!?4j99=<VLDN@e_O0ujB?2HTz4iOuYuBMq*i|J}R00lQh
> zi#v2<7eCO0UEHA`hd2&%9J<{|)qq|7<gOIcdboodZmmf>zbKVeLlfjVkVha6#uSG*
> z7>hXA!K8`nFf<UaVRKfh0V9(P!^8lY<{fG6JJJ||m}&ctG-ide?HPBOKQK?<^N@MM
> z<N_9z_L_&x+iM=O#H_}Un8>=lW+GebDyHn*>C86lPC$CQyA8Yf*X4DN90JSh3^@e0
> z*9CG2aWa}upBTmA$Ya3};2a<99un^w5;=XN52x97k!X$@emv6I98ZEci&BeIi^@_{
> zjHff+;nbcufoHqLK8_2FaB-9AhM^qh+dU3&m^BK&;a6s0Xb@pA;8Ow8E_}-v&9_f<
> z<Xp@nXv*N`<LDmm9ug4m>JcB{5(+8-4Mok+h2woZ{iYW>acWMSz_Q)MkCTIuk!`!J
> zKj%_LV0eg4uL<N7nEoVyvuk@-AZGwSNKBN8;Q|N9IuV8m%&I_o39}X}@AR7qoW0v8
> zC342`Z?7rjWJ-{Z;kN`z$}mW9TLEbk?rBWcK>7@CAEWm6nHM>`IVGTO3~&qzb`3&v
> zs+J7YsTi^_7prYoxy^Y67%LAskF)ZIg!=ip`oxF%IQqqVPIrvtG}zwoobyj70MMh>
> AV*mgE
>
> --
> 2.35.1
>
