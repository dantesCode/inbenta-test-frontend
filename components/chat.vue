<template>
    <form @submit.prevent="handleSubmit" class="checkout-form">
        <div>
            <li v-for="item in messages">
                {{ item.message }}
            </li>
            <input v-model="message" placeholder=""/>
            <button type="submit">Submit</button>
        </div>
    </form>
</template>

<script>
export default {
    data() {
        return {
            message: '',
            lastMessage: '',
            messages: [{ who: 'me', message: 'Hello' }, { who: 'bot', message: 'In a dark place we find ourselves, and a little more knowledge lights our way. What knowledge do you seek?' }]
        }
    },
    methods: {
        async handleSubmit() {
            this.messages.push({who: 'me', message: 'test'})

            //not working properly because of CORS
            const formData = new FormData()
            formData.append('message', this.message)
            const {data: testing} = await useFetch('http://localhost:8080/chat/message',
                {
                method: 'POST',
                mode: 'no-cors',
                body: {'message':this.message},
                headers: {
                    "Content-Type": "multipart/form-data",
                },}
            )
            console.log(testing)
        }
    },
}
</script>